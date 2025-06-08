// src/components/Generation/Text/TextGenerationProvider.tsx
import React, {
  createContext,
  useContext,
  useState,
  useEffect,
  useRef,
  ReactNode,
  RefObject,
} from 'react';
import axios from 'axios';

// 1. Định nghĩa kiểu dữ liệu cho context
interface Message {
  type: string;
  content: string;
  reasoning?: string;
  agentName?: string;
}

interface TextGenerationContextType {
  query: string;
  setQuery: (value: string) => void;
  messages: Message[];
  loading: boolean;
  error: string | null;
  status: string;
  expandedReasoning: Set<number>;
  toggleReasoning: (index: number) => void;
  sendQuery: (inputQuery: string) => void;
  stopRequest: () => void;
  messagesEndRef: RefObject<HTMLDivElement>;
}

// 2. Khởi tạo context với kiểu rõ ràng
const TextGenerationContext = createContext<TextGenerationContextType | undefined>(undefined);

// 3. Provider chính
export function TextGenerationProvider({ children }: { children: ReactNode }) {
  const [query, setQuery] = useState('');
  const [messages, setMessages] = useState<Message[]>([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);
  const [status, setStatus] = useState('Ready');
  const [expandedReasoning, setExpandedReasoning] = useState<Set<any>>(new Set());
  const messagesEndRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  };

  const toggleReasoning = (index: any) => {
    setExpandedReasoning((prev) => {
      const newSet = new Set(prev);
      if (newSet.has(index)) newSet.delete(index);
      else newSet.add(index);
      return newSet;
    });
  };

  const sendQuery = async (inputQuery: string) => {
    if (!inputQuery.trim()) return;
    setLoading(true);
    setError(null);
    setMessages((prev) => [...prev, { type: 'user', content: inputQuery }]);
    setQuery('');

    try {
      const res = await axios.post('http://127.0.0.1:8000/query', {
        query: inputQuery,
        tts_enabled: false,
      });
      const data = res.data;
      setMessages((prev) => [
        ...prev,
        {
          type: 'agent',
          content: data.answer || 'No answer',
          reasoning: data.reasoning,
          agentName: data.agent_name || 'Agent',
        },
      ]);
      setStatus(data.status || 'Completed');
    } catch (err) {
      setError('Failed to get response');
      setMessages((prev) => [
        ...prev,
        { type: 'error', content: 'Error: Unable to get a response.' },
      ]);
    } finally {
      setLoading(false);
    }
  };

  const stopRequest = async () => {
    setLoading(false);
    try {
      await axios.get('http://127.0.0.1:8000/stop');
      setStatus('Requesting stop...');
    } catch {
      setError('Failed to stop request');
    }
  };

  return (
    <TextGenerationContext.Provider
      value={{
        query,
        setQuery,
        messages,
        loading,
        error,
        status,
        expandedReasoning,
        toggleReasoning,
        sendQuery,
        stopRequest,
        messagesEndRef,
      }}
    >
      {children}
    </TextGenerationContext.Provider>
  );
}

// 4. Custom hook để dùng context một cách an toàn
export const useTextGeneration = (): TextGenerationContextType => {
  const context = useContext(TextGenerationContext);
  if (!context) {
    throw new Error('useTextGeneration must be used within a TextGenerationProvider');
  }
  return context;
};
