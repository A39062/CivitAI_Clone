import clsx from 'clsx';
import React, { useEffect, useRef, useState } from 'react';
import { useRouter } from 'next/router';
import { AppHeader, RenderSearchComponentProps } from '~/components/AppLayout/AppHeader/AppHeader';
import { NotFound } from '~/components/AppLayout/NotFound';
import { SubNav2 } from '~/components/AppLayout/SubNav';
import { PageLoader } from '~/components/PageLoader/PageLoader';
import { ScrollArea } from '~/components/ScrollArea/ScrollArea';
import { useScrollAreaRef } from '~/components/ScrollArea/ScrollAreaContext';
import { Announcements } from '~/components/Announcements/Announcements';
import { ScrollAreaProps } from '~/components/ScrollArea/ScrollArea';
import { AdhesiveAd } from '~/components/Ads/AdhesiveAd';
import { useCurrentUser } from '~/hooks/useCurrentUser';
import { openReadOnlyModal } from '~/components/Dialog/dialog-registry';
import { useFeatureFlags } from '~/providers/FeatureFlagsProvider';
import { useIsMounted } from '~/hooks/useIsMounted';
import { ChatPortal } from '~/components/Chat/ChatProvider';
import { SidebarFooterContent } from '~/components/AppLayout/AppFooter';

let shownReadonly = false;
const readonlyAlertCutoff = Date.now() - 1000 * 60 * 30;

export function AppLayout({
  children,
  renderSearchComponent,
  right,
  scrollable = true,
  loading,
  notFound,
  announcements,
}: {
  children: React.ReactNode;
  renderSearchComponent?: (opts: RenderSearchComponentProps) => React.ReactElement;
  right?: React.ReactNode;
  scrollable?: boolean;
  loading?: boolean;
  notFound?: boolean;
  announcements?: boolean;
}) {
  const isMounted = useIsMounted();
  const features = useFeatureFlags();
  const [menuOpen, setMenuOpen] = useState<boolean>(false);

  useEffect(() => {
    if (isMounted() && !features.canWrite && !shownReadonly) {
      const lastReadOnly = Number(localStorage.getItem('lastReadOnlyNotice') ?? '0');
      if (lastReadOnly < readonlyAlertCutoff) {
        openReadOnlyModal();
        localStorage.setItem('lastReadOnlyNotice', Date.now().toString());
        shownReadonly = true;
      }
    }
  }, []);

  return (
    <div className="flex min-h-screen flex-col">
      <AppHeader
        fixed={false}
        renderSearchComponent={renderSearchComponent}
        onMenuToggle={setMenuOpen}
      />

      {loading ? (
        <PageLoader />
      ) : notFound ? (
        <NotFound />
      ) : (
        <div className="flex flex-1 overflow-hidden">
          {/* Sidebar */}
          {menuOpen && (
            <aside className="flex w-[240px] min-w-[180px] max-w-[260px] flex-col justify-between border-r border-gray-3 bg-dark-6 dark:border-dark-4">
              <div className="flex-1 overflow-y-auto">
                <SubNav2 isVisible={menuOpen} />
              </div>
              <SidebarFooterContent />
            </aside>
          )}

          {/* Main content */}
          <div className="flex flex-1 flex-col">
            <MainContent scrollable={scrollable} announcements={announcements} subNav={null}>
              {children}
              <ChatPortal showFooter={false} />
            </MainContent>
          </div>

          {/* Optional right sidebar */}
          {right && (
            <aside className="scroll-area relative border-l border-gray-3 dark:border-dark-4">
              {right}
            </aside>
          )}
        </div>
      )}

      <AdhesiveFooter />
    </div>
  );
}

function AdhesiveFooter() {
  const currentUser = useCurrentUser();
  const router = useRouter();

  if (currentUser?.isPaidMember || router.asPath.includes('/moderator')) return null;
  return <AdhesiveAd />;
}

export function MainContent({
  children,
  subNav,
  scrollable = true,
  announcements,
  ...props
}: {
  children: React.ReactNode;
  subNav?: React.ReactNode | null;
  scrollable?: boolean;
  announcements?: boolean;
} & ScrollAreaProps) {
  return scrollable ? (
    <ScrollArea {...props}>
      <main className="flex flex-1 flex-col">
        {subNav && <SubNav>{subNav}</SubNav>}
        {announcements && <Announcements />}
        <div className="flex flex-1 flex-col">{children}</div>
      </main>
    </ScrollArea>
  ) : (
    <div className="no-scroll group flex flex-1 flex-col overflow-hidden">
      <main className="flex flex-1 flex-col overflow-hidden">
        {subNav && <SubNav>{subNav}</SubNav>}
        <div className="flex flex-1 flex-col">{children}</div>
      </main>
    </div>
  );
}

export function SubNav({
  children,
  className,
  visible,
  ...props
}: { children: React.ReactNode; visible?: boolean } & React.HTMLProps<HTMLDivElement>) {
  const lastScrollRef = useRef(0);
  const lastDirectionChangeRef = useRef(0);
  const lastScrollDirectionRef = useRef('up');
  const [showNav, setShowNav] = useState(true);

  useScrollAreaRef({
    onScroll: (node) => {
      const diff = node.scrollTop - lastScrollRef.current;
      const scrollDirection = diff > 0 ? 'down' : 'up';

      if (scrollDirection !== lastScrollDirectionRef.current) {
        lastScrollDirectionRef.current = scrollDirection;
        lastDirectionChangeRef.current = node.scrollTop;
      }

      const lastDirectionChangeDiff = node.scrollTop - lastDirectionChangeRef.current;

      if (node.scrollTop < 100) setShowNav(true);
      else if (lastDirectionChangeDiff > 100) setShowNav(false);
      else if (lastDirectionChangeDiff < -100) setShowNav(true);

      lastScrollRef.current = node.scrollTop;
    },
  });

  useEffect(() => {
    if (visible) setShowNav(true);
  }, [visible]);

  return (
    <div
      {...props}
      className={clsx(
        'sticky inset-x-0 top-0 z-50 mb-3 bg-gray-1 shadow transition-transform dark:bg-dark-6',
        className
      )}
      style={!showNav ? { transform: 'translateY(-200%)' } : undefined}
    >
      {children}
    </div>
  );
}
