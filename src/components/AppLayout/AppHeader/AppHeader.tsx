import { ActionIcon, Button, Divider, Grid, Header } from '@mantine/core';
import { IconSearch, IconMenu2 } from '@tabler/icons-react';
import { useRouter } from 'next/router';
import { ReactElement, RefObject, useRef, useState } from 'react';
import { BrowsingModeIcon } from '~/components/BrowsingMode/BrowsingMode';
import { ReadOnlyNotice } from '~/components/ReadOnlyNotice/ReadOnlyNotice';
import { ChatButton } from '~/components/Chat/ChatButton';
import { CivitaiLinkPopover } from '~/components/CivitaiLink/CivitaiLinkPopover';
import { Logo } from '~/components/Logo/Logo';
import { ImpersonateButton } from '~/components/Moderation/ImpersonateButton';
import { ModerationNav } from '~/components/Moderation/ModerationNav';
import { NotificationBell } from '~/components/Notifications/NotificationBell';
import { UploadTracker } from '~/components/Resource/UploadTracker';
import { SupportButton } from '~/components/SupportButton/SupportButton';
import { useCurrentUser } from '~/hooks/useCurrentUser';
import { useFeatureFlags } from '~/providers/FeatureFlagsProvider';
import { AutocompleteSearch } from '../../AutocompleteSearch/AutocompleteSearch';
import clsx from 'clsx';
import { NextLink as Link } from '~/components/NextLink/NextLink';
import { UserMenu } from '~/components/AppLayout/AppHeader/UserMenu';
import { CreateMenu } from '~/components/AppLayout/AppHeader/CreateMenu';
import { useTranslation } from 'next-i18next';

const HEADER_HEIGHT = 60;

function defaultRenderSearchComponent({ onSearchDone, isMobile, ref }: RenderSearchComponentProps) {
  if (isMobile) {
    return (
      <AutocompleteSearch
        variant="filled"
        onClear={onSearchDone}
        onSubmit={onSearchDone}
        rightSection={null}
        ref={ref}
      />
    );
  }

  return <AutocompleteSearch />;
}

export type RenderSearchComponentProps = {
  onSearchDone?: () => void;
  isMobile: boolean;
  ref?: RefObject<HTMLInputElement>;
};

type Props = {
  renderSearchComponent?: (opts: RenderSearchComponentProps) => ReactElement;
  fixed?: boolean;
  onMenuToggle?: (isOpen: boolean) => void; // Thêm prop để truyền trạng thái opened
};

export function AppHeader({
  renderSearchComponent = defaultRenderSearchComponent,
  fixed = true,
  onMenuToggle,
}: Props) {
  const currentUser = useCurrentUser();
  const router = useRouter();
  const features = useFeatureFlags();
  const searchRef = useRef<HTMLInputElement>(null);
  const isMuted = currentUser?.muted ?? false;
  const { t } = useTranslation();
  const [showSearch, setShowSearch] = useState(false);
  const onSearchDone = () => setShowSearch(false);
  const [isMenuOpen, setIsMenuOpen] = useState(false);
  // Xử lý trạng thái mở/đóng của UserMenu2
  const handleMenuToggle = (isOpen: boolean) => {
    if (onMenuToggle) {
      onMenuToggle(isOpen);
    }
  };

  const handleMenuClick = () => {
    const newState = !isMenuOpen;
    setIsMenuOpen(newState);
    onMenuToggle?.(newState); // Gửi trạng thái ra ngoài qua prop
  };

  return (
    <>
      <Header
        height={HEADER_HEIGHT}
        fixed={fixed}
        zIndex={199}
        className={clsx({
          ['border-green-8 border-b-[3px]']: features.isGreen,
          ['border-red-8 border-b-[3px]']: features.isRed,
        })}
      >
        <div className={clsx('h-full', { ['hidden']: !showSearch })}>
          {renderSearchComponent({ onSearchDone, isMobile: true, ref: searchRef })}
        </div>

        <Grid
          className={clsx('flex h-full flex-nowrap items-center justify-between px-2 @md:px-4', {
            ['hidden']: showSearch,
          })}
          m={0}
          gutter="xs"
          align="center"
        >
          <Grid.Col span="auto" pl={0}>
            <div className="flex items-center gap-2.5">
              {/* <UserMenu2 onToggle={handleMenuToggle} /> Truyền callback */}
              <ActionIcon onClick={handleMenuClick} variant="subtle" aria-label="Toggle menu">
                <IconMenu2 />
              </ActionIcon>
              <Logo />
              {!features.canWrite ? <ReadOnlyNotice /> : <SupportButton />}
              {/* Disabled until next event */}
              {/* <EventButton /> */}
            </div>
          </Grid.Col>
          <Grid.Col span={6} md={4} className="@max-md:hidden">
            {renderSearchComponent({ onSearchDone, isMobile: false })}
          </Grid.Col>
          <Grid.Col span="auto" className="flex items-center justify-end gap-3 @max-md:hidden">
            <div className="flex items-center gap-3">
              {!isMuted && <CreateMenu />}
              {currentUser && (
                <>
                  <UploadTracker />
                  <CivitaiLinkPopover />
                </>
              )}
              {currentUser && features.canViewNsfw && <BrowsingModeIcon />}
              {currentUser && <NotificationBell />}
              {currentUser && features.chat && <ChatButton />}
              {currentUser?.isModerator && <ModerationNav />}
              {currentUser && <ImpersonateButton />}
            </div>
            {!currentUser ? (
              <Button
                component={Link}
                href={`/login?returnUrl=${router.asPath}`}
                rel="nofollow"
                variant="default"
              >
                {t('signIn')}
              </Button>
            ) : (
              <Divider orientation="vertical" />
            )}
            <UserMenu />
          </Grid.Col>
          <Grid.Col span="auto" className="flex items-center justify-end @md:hidden">
            <div className="flex items-center gap-1">
              {!isMuted && <CreateMenu />}
              <ActionIcon onClick={() => setShowSearch(true)}>
                <IconSearch />
              </ActionIcon>
              {currentUser && <CivitaiLinkPopover />}
              {currentUser && <NotificationBell />}
              {currentUser && features.chat && <ChatButton />}
              {currentUser && <ImpersonateButton />}
              <UserMenu />
            </div>
          </Grid.Col>
        </Grid>
      </Header>
    </>
  );
}
