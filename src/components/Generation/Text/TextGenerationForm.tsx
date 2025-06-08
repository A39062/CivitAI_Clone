// src/components/Generation/Text/TextGenerationForm.tsx
import React from 'react';
import ReactMarkdown from 'react-markdown';
import { useTextGeneration } from './TextGenerationProvider';

export function TextGenerationForm() {
  const {
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
  } = useTextGeneration();

  const handleSubmit = (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    sendQuery(query);
  };

  return (
    <div
      className="text-generation-form"
      style={{ display: 'flex', flexDirection: 'column', height: '100%' }}
    >
      <div
        className="messages"
        style={{
          flexGrow: 1,
          overflowY: 'auto',
          padding: '1rem',
          border: '1px solid #ddd',
          borderRadius: 4,
        }}
      >
        {messages.length === 0 ? (
          <p style={{ color: '#888' }}>No messages yet. Type below to start!</p>
        ) : (
          messages.map((msg, i) => (
            <div
              key={i}
              style={{
                marginBottom: '1rem',
                backgroundColor:
                  msg.type === 'user' ? '#d0eaff' : msg.type === 'agent' ? '#f0f0f0' : '#ffe0e0',
                padding: '0.5rem 1rem',
                borderRadius: 8,
              }}
            >
              <div style={{ fontWeight: 'bold', marginBottom: 4 }}>
                {msg.type === 'agent' && msg.agentName
                  ? msg.agentName
                  : msg.type === 'user'
                  ? 'You'
                  : 'Error'}
              </div>
              <div>
                <ReactMarkdown>{msg.content}</ReactMarkdown>
              </div>
              {msg.type === 'agent' && msg.reasoning && (
                <>
                  <button
                    onClick={() => toggleReasoning(i)}
                    style={{ marginTop: 4, fontSize: 12, cursor: 'pointer' }}
                  >
                    {expandedReasoning.has(i) ? '▼ Hide Reasoning' : '▶ Show Reasoning'}
                  </button>
                  {expandedReasoning.has(i) && (
                    <div
                      style={{
                        backgroundColor: '#eee',
                        marginTop: 4,
                        padding: 8,
                        borderRadius: 4,
                        fontSize: 13,
                      }}
                    >
                      <ReactMarkdown>{msg.reasoning}</ReactMarkdown>
                    </div>
                  )}
                </>
              )}
            </div>
          ))
        )}
        <div ref={messagesEndRef} />
      </div>

      {error && <div style={{ color: 'red', marginTop: 8 }}>{error}</div>}

      <form
        onSubmit={handleSubmit}
        style={{ display: 'flex', marginTop: 8, gap: 8, alignItems: 'center' }}
      >
        <input
          type="text"
          value={query}
          onChange={(e) => setQuery(e.target.value)}
          placeholder="Type your query..."
          disabled={loading}
          style={{ flexGrow: 1, padding: 8, fontSize: 16 }}
        />
        <button type="submit" disabled={loading}>
          Send
        </button>
        <button type="button" onClick={stopRequest} disabled={!loading}>
          Stop
        </button>
      </form>

      <div style={{ marginTop: 4, fontSize: 12, color: '#666' }}>
        Status: {loading ? 'Loading...' : status}
      </div>
    </div>
  );
}
