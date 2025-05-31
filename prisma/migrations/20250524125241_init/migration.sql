CREATE EXTENSION IF NOT EXISTS citext;

-- CreateEnum
CREATE TYPE "BuzzWithdrawalRequestStatus" AS ENUM ('Requested', 'Canceled', 'Rejected', 'Approved', 'Reverted', 'Transferred', 'ExternallyResolved');

-- CreateEnum
CREATE TYPE "UserPaymentConfigurationProvider" AS ENUM ('Stripe', 'Tipalti');

-- CreateEnum
CREATE TYPE "CashWithdrawalStatus" AS ENUM ('Paid', 'Rejected', 'Scheduled', 'Submitted', 'Deferred', 'DeferredInternal', 'Canceled', 'Cleared', 'FraudReview', 'PendingPayerFunds', 'InternalValue', 'FailedFee');

-- CreateEnum
CREATE TYPE "CashWithdrawalMethod" AS ENUM ('NoPM', 'WireTransfer', 'Payoneer', 'PayPal', 'ACH', 'Check', 'eCheck', 'HoldMyPayments', 'Custom', 'Intercash', 'Card', 'TipaltiInternalValue');

-- CreateEnum
CREATE TYPE "RewardsEligibility" AS ENUM ('Eligible', 'Ineligible', 'Protected');

-- CreateEnum
CREATE TYPE "PaymentProvider" AS ENUM ('Stripe', 'Paddle');

-- CreateEnum
CREATE TYPE "UserEngagementType" AS ENUM ('Follow', 'Hide', 'Block');

-- CreateEnum
CREATE TYPE "LinkType" AS ENUM ('Sponsorship', 'Social', 'Other');

-- CreateEnum
CREATE TYPE "ModelType" AS ENUM ('Checkpoint', 'TextualInversion', 'Hypernetwork', 'AestheticGradient', 'LORA', 'LoCon', 'DoRA', 'Controlnet', 'Upscaler', 'MotionModule', 'VAE', 'Poses', 'Wildcards', 'Workflows', 'Detection', 'Other');

-- CreateEnum
CREATE TYPE "ImportStatus" AS ENUM ('Pending', 'Processing', 'Failed', 'Completed');

-- CreateEnum
CREATE TYPE "ModelStatus" AS ENUM ('Draft', 'Training', 'Published', 'Scheduled', 'Unpublished', 'UnpublishedViolation', 'GatherInterest', 'Deleted');

-- CreateEnum
CREATE TYPE "TrainingStatus" AS ENUM ('Pending', 'Submitted', 'Paused', 'Denied', 'Processing', 'InReview', 'Failed', 'Approved');

-- CreateEnum
CREATE TYPE "CommercialUse" AS ENUM ('None', 'Image', 'RentCivit', 'Rent', 'Sell');

-- CreateEnum
CREATE TYPE "CheckpointType" AS ENUM ('Trained', 'Merge');

-- CreateEnum
CREATE TYPE "ModelUploadType" AS ENUM ('Created', 'Trained');

-- CreateEnum
CREATE TYPE "ModelUsageControl" AS ENUM ('Download', 'Generation', 'InternalGeneration');

-- CreateEnum
CREATE TYPE "ModelModifier" AS ENUM ('Archived', 'TakenDown');

-- CreateEnum
CREATE TYPE "ContentType" AS ENUM ('Image', 'Character', 'Text', 'Audio');

-- CreateEnum
CREATE TYPE "ModelFlagStatus" AS ENUM ('Pending', 'Resolved');

-- CreateEnum
CREATE TYPE "ModelEngagementType" AS ENUM ('Favorite', 'Hide', 'Mute', 'Notify');

-- CreateEnum
CREATE TYPE "ModelVersionSponsorshipSettingsType" AS ENUM ('FixedPrice', 'Bidding');

-- CreateEnum
CREATE TYPE "ModelVersionMonetizationType" AS ENUM ('PaidAccess', 'PaidEarlyAccess', 'PaidGeneration', 'CivitaiClubOnly', 'MySubscribersOnly', 'Sponsored');

-- CreateEnum
CREATE TYPE "ModelVersionEngagementType" AS ENUM ('Notify');

-- CreateEnum
CREATE TYPE "ModelHashType" AS ENUM ('AutoV1', 'AutoV2', 'AutoV3', 'SHA256', 'CRC32', 'BLAKE3');

-- CreateEnum
CREATE TYPE "ScanResultCode" AS ENUM ('Pending', 'Success', 'Danger', 'Error');

-- CreateEnum
CREATE TYPE "ModelFileVisibility" AS ENUM ('Sensitive', 'Private', 'Public');

-- CreateEnum
CREATE TYPE "MetricTimeframe" AS ENUM ('Day', 'Week', 'Month', 'Year', 'AllTime');

-- CreateEnum
CREATE TYPE "AssociationType" AS ENUM ('Suggested');

-- CreateEnum
CREATE TYPE "ReportReason" AS ENUM ('TOSViolation', 'NSFW', 'Ownership', 'AdminAttention', 'Claim', 'CSAM');

-- CreateEnum
CREATE TYPE "ReportStatus" AS ENUM ('Pending', 'Processing', 'Actioned', 'Unactioned');

-- CreateEnum
CREATE TYPE "ReviewReactions" AS ENUM ('Like', 'Dislike', 'Laugh', 'Cry', 'Heart');

-- CreateEnum
CREATE TYPE "ImageGenerationProcess" AS ENUM ('txt2img', 'txt2imgHiRes', 'img2img', 'inpainting');

-- CreateEnum
CREATE TYPE "NsfwLevel" AS ENUM ('None', 'Soft', 'Mature', 'X', 'Blocked');

-- CreateEnum
CREATE TYPE "ImageIngestionStatus" AS ENUM ('Pending', 'Scanned', 'Error', 'Blocked', 'NotFound', 'PendingManualAssignment');

-- CreateEnum
CREATE TYPE "MediaType" AS ENUM ('image', 'video', 'audio');

-- CreateEnum
CREATE TYPE "ModelFileType" AS ENUM ('Model', 'TrainingData');

-- CreateEnum
CREATE TYPE "BlockImageReason" AS ENUM ('Ownership', 'CSAM', 'TOS');

-- CreateEnum
CREATE TYPE "ImageEngagementType" AS ENUM ('Favorite', 'Hide');

-- CreateEnum
CREATE TYPE "ImageOnModelType" AS ENUM ('Example', 'Training');

-- CreateEnum
CREATE TYPE "TagTarget" AS ENUM ('Model', 'Question', 'Image', 'Post', 'Tag', 'Article', 'Bounty', 'Collection');

-- CreateEnum
CREATE TYPE "TagType" AS ENUM ('UserGenerated', 'Label', 'Moderation', 'System');

-- CreateEnum
CREATE TYPE "TagsOnTagsType" AS ENUM ('Parent', 'Replace', 'Append');

-- CreateEnum
CREATE TYPE "TagSource" AS ENUM ('User', 'Rekognition', 'WD14', 'Computed', 'ImageHash', 'Hive', 'MinorDetection', 'HiveDemographics', 'Clavata');

-- CreateEnum
CREATE TYPE "PartnerPricingModel" AS ENUM ('Duration', 'PerImage');

-- CreateEnum
CREATE TYPE "ApiKeyType" AS ENUM ('System', 'User');

-- CreateEnum
CREATE TYPE "KeyScope" AS ENUM ('Read', 'Write', 'Generate');

-- CreateEnum
CREATE TYPE "TagEngagementType" AS ENUM ('Hide', 'Follow', 'Allow');

-- CreateEnum
CREATE TYPE "CosmeticType" AS ENUM ('Badge', 'NamePlate', 'ContentDecoration', 'ProfileDecoration', 'ProfileBackground');

-- CreateEnum
CREATE TYPE "CosmeticSource" AS ENUM ('Trophy', 'Purchase', 'Event', 'Membership', 'Claim');

-- CreateEnum
CREATE TYPE "CosmeticEntity" AS ENUM ('Model', 'Image', 'Article', 'Post');

-- CreateEnum
CREATE TYPE "BuzzAccountType" AS ENUM ('user', 'generation', 'club');

-- CreateEnum
CREATE TYPE "ArticleStatus" AS ENUM ('Draft', 'Published', 'Unpublished');

-- CreateEnum
CREATE TYPE "ArticleEngagementType" AS ENUM ('Favorite', 'Hide');

-- CreateEnum
CREATE TYPE "GenerationSchedulers" AS ENUM ('EulerA', 'Euler', 'LMS', 'Heun', 'DPM2', 'DPM2A', 'DPM2SA', 'DPM2M', 'DPMSDE', 'DPMFast', 'DPMAdaptive', 'LMSKarras', 'DPM2Karras', 'DPM2AKarras', 'DPM2SAKarras', 'DPM2MKarras', 'DPMSDEKarras', 'DDIM');

-- CreateEnum
CREATE TYPE "CollectionWriteConfiguration" AS ENUM ('Private', 'Public', 'Review');

-- CreateEnum
CREATE TYPE "CollectionReadConfiguration" AS ENUM ('Private', 'Public', 'Unlisted');

-- CreateEnum
CREATE TYPE "CollectionType" AS ENUM ('Model', 'Article', 'Post', 'Image');

-- CreateEnum
CREATE TYPE "CollectionMode" AS ENUM ('Contest', 'Bookmark');

-- CreateEnum
CREATE TYPE "CollectionItemStatus" AS ENUM ('ACCEPTED', 'REVIEW', 'REJECTED');

-- CreateEnum
CREATE TYPE "CollectionContributorPermission" AS ENUM ('VIEW', 'ADD', 'ADD_REVIEW', 'MANAGE');

-- CreateEnum
CREATE TYPE "HomeBlockType" AS ENUM ('Collection', 'Announcement', 'Leaderboard', 'Social', 'Event', 'CosmeticShop', 'FeaturedModelVersion');

-- CreateEnum
CREATE TYPE "Currency" AS ENUM ('USD', 'BUZZ');

-- CreateEnum
CREATE TYPE "BountyType" AS ENUM ('ModelCreation', 'LoraCreation', 'EmbedCreation', 'DataSetCreation', 'DataSetCaption', 'ImageCreation', 'VideoCreation', 'Other');

-- CreateEnum
CREATE TYPE "BountyMode" AS ENUM ('Individual', 'Split');

-- CreateEnum
CREATE TYPE "BountyEntryMode" AS ENUM ('Open', 'BenefactorsOnly');

-- CreateEnum
CREATE TYPE "BountyEngagementType" AS ENUM ('Favorite', 'Track');

-- CreateEnum
CREATE TYPE "CsamReportType" AS ENUM ('Image', 'TrainingData');

-- CreateEnum
CREATE TYPE "Availability" AS ENUM ('Public', 'Unsearchable', 'Private', 'EarlyAccess');

-- CreateEnum
CREATE TYPE "EntityCollaboratorStatus" AS ENUM ('Pending', 'Approved', 'Rejected');

-- CreateEnum
CREATE TYPE "ClubAdminPermission" AS ENUM ('ManageMemberships', 'ManageTiers', 'ManagePosts', 'ManageClub', 'ManageResources', 'ViewRevenue', 'WithdrawRevenue');

-- CreateEnum
CREATE TYPE "ChatMemberStatus" AS ENUM ('Invited', 'Joined', 'Ignored', 'Left', 'Kicked');

-- CreateEnum
CREATE TYPE "ChatMessageType" AS ENUM ('Markdown', 'Image', 'Video', 'Audio', 'Embed');

-- CreateEnum
CREATE TYPE "PurchasableRewardUsage" AS ENUM ('SingleUse', 'MultiUse');

-- CreateEnum
CREATE TYPE "EntityType" AS ENUM ('Image', 'Post', 'Article', 'Bounty', 'BountyEntry', 'ModelVersion', 'Model', 'Collection');

-- CreateEnum
CREATE TYPE "JobQueueType" AS ENUM ('CleanUp', 'UpdateMetrics', 'UpdateNsfwLevel', 'UpdateSearchIndex', 'CleanIfEmpty');

-- CreateEnum
CREATE TYPE "VaultItemStatus" AS ENUM ('Pending', 'Stored', 'Failed');

-- CreateEnum
CREATE TYPE "RedeemableCodeType" AS ENUM ('Buzz', 'Membership');

-- CreateEnum
CREATE TYPE "ToolType" AS ENUM ('Image', 'Video', 'MotionCapture', 'Upscalers', 'Audio', 'Compute', 'GameEngines', 'Editor', 'LLM');

-- CreateEnum
CREATE TYPE "TechniqueType" AS ENUM ('Image', 'Video');

-- CreateEnum
CREATE TYPE "AppealStatus" AS ENUM ('Pending', 'Approved', 'Rejected');

-- CreateEnum
CREATE TYPE "AuctionType" AS ENUM ('Model', 'Image', 'Collection', 'Article');

-- CreateEnum
CREATE TYPE "ModerationRuleAction" AS ENUM ('Approve', 'Block', 'Hold');

-- CreateEnum
CREATE TYPE "ChangelogType" AS ENUM ('Feature', 'Bugfix', 'Policy', 'Update', 'Incident');

-- CreateEnum
CREATE TYPE "NewOrderRankType" AS ENUM ('Acolyte', 'Knight', 'Templar');

-- CreateEnum
CREATE TYPE "EntityMetric_EntityType_Type" AS ENUM ('Image');

-- CreateEnum
CREATE TYPE "EntityMetric_MetricType_Type" AS ENUM ('ReactionLike', 'ReactionHeart', 'ReactionLaugh', 'ReactionCry', 'Comment', 'Collection', 'Buzz');

-- CreateTable
CREATE TABLE "Account" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "provider" TEXT NOT NULL,
    "providerAccountId" TEXT NOT NULL,
    "refresh_token" TEXT,
    "access_token" TEXT,
    "expires_at" INTEGER,
    "token_type" TEXT,
    "scope" TEXT,
    "id_token" TEXT,
    "session_state" TEXT,
    "metadata" JSONB NOT NULL DEFAULT '{}',

    CONSTRAINT "Account_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Session" (
    "id" SERIAL NOT NULL,
    "sessionToken" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Session_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionInvalidation" (
    "userId" INTEGER NOT NULL,
    "invalidatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionInvalidation_pkey" PRIMARY KEY ("userId","invalidatedAt")
);

-- CreateTable
CREATE TABLE "UserReferral" (
    "id" SERIAL NOT NULL,
    "userReferralCodeId" INTEGER,
    "source" TEXT,
    "landingPage" TEXT,
    "loginRedirectReason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "note" TEXT,

    CONSTRAINT "UserReferral_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserReferralCode" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "code" TEXT NOT NULL,
    "note" TEXT,
    "deletedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserReferralCode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserPaymentConfiguration" (
    "userId" INTEGER NOT NULL,
    "tipaltiAccountId" TEXT,
    "tipaltiAccountStatus" TEXT NOT NULL DEFAULT 'PendingOnboarding',
    "tipaltiPaymentsEnabled" BOOLEAN NOT NULL DEFAULT false,
    "tipaltiWithdrawalMethod" "CashWithdrawalMethod",
    "stripeAccountId" TEXT,
    "stripeAccountStatus" TEXT NOT NULL DEFAULT 'PendingOnboarding',
    "stripePaymentsEnabled" BOOLEAN NOT NULL DEFAULT false,
    "meta" JSONB NOT NULL DEFAULT '{}'
);

-- CreateTable
CREATE TABLE "BuzzWithdrawalRequestHistory" (
    "id" TEXT NOT NULL,
    "requestId" TEXT NOT NULL,
    "updatedById" INTEGER NOT NULL,
    "status" "BuzzWithdrawalRequestStatus" NOT NULL DEFAULT 'Requested',
    "note" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "metadata" JSONB NOT NULL DEFAULT '{}',

    CONSTRAINT "BuzzWithdrawalRequestHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BuzzWithdrawalRequest" (
    "id" TEXT NOT NULL,
    "userId" INTEGER,
    "requestedToProvider" "UserPaymentConfigurationProvider" NOT NULL DEFAULT 'Stripe',
    "requestedToId" TEXT NOT NULL,
    "buzzWithdrawalTransactionId" TEXT NOT NULL,
    "requestedBuzzAmount" INTEGER NOT NULL,
    "platformFeeRate" INTEGER NOT NULL,
    "transferredAmount" INTEGER,
    "transferId" TEXT,
    "currency" "Currency",
    "metadata" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "status" "BuzzWithdrawalRequestStatus" NOT NULL DEFAULT 'Requested',

    CONSTRAINT "BuzzWithdrawalRequest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CashWithdrawal" (
    "id" TEXT NOT NULL,
    "transactionId" TEXT,
    "userId" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "method" "CashWithdrawalMethod" NOT NULL,
    "fee" INTEGER NOT NULL,
    "status" "CashWithdrawalStatus" NOT NULL,
    "note" TEXT,
    "metadata" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "CashWithdrawal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "username" CITEXT,
    "email" CITEXT,
    "emailVerified" TIMESTAMP(3),
    "image" TEXT,
    "showNsfw" BOOLEAN NOT NULL DEFAULT false,
    "blurNsfw" BOOLEAN NOT NULL DEFAULT true,
    "browsingLevel" INTEGER NOT NULL DEFAULT 1,
    "onboarding" INTEGER NOT NULL DEFAULT 0,
    "isModerator" BOOLEAN DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),
    "subscriptionId" TEXT,
    "mutedAt" TIMESTAMP(3),
    "muted" BOOLEAN NOT NULL DEFAULT false,
    "muteConfirmedAt" TIMESTAMP(3),
    "bannedAt" TIMESTAMP(3),
    "autoplayGifs" BOOLEAN DEFAULT true,
    "filePreferences" JSONB NOT NULL DEFAULT '{"size": "pruned", "fp": "fp16", "format": "SafeTensor"}',
    "meta" JSONB DEFAULT '{}',
    "leaderboardShowcase" TEXT,
    "excludeFromLeaderboards" BOOLEAN NOT NULL DEFAULT false,
    "rewardsEligibility" "RewardsEligibility" NOT NULL DEFAULT 'Eligible',
    "eligibilityChangedAt" TIMESTAMP(3),
    "customerId" TEXT,
    "paddleCustomerId" TEXT,
    "profilePictureId" INTEGER,
    "settings" JSONB DEFAULT '{}',
    "publicSettings" JSONB DEFAULT '{}',

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CustomerSubscription" (
    "id" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "metadata" JSONB NOT NULL,
    "status" TEXT NOT NULL,
    "priceId" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "cancelAtPeriodEnd" BOOLEAN NOT NULL,
    "cancelAt" TIMESTAMP(3),
    "canceledAt" TIMESTAMP(3),
    "currentPeriodStart" TIMESTAMP(3) NOT NULL,
    "currentPeriodEnd" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL,
    "endedAt" TIMESTAMP(3),
    "updatedAt" TIMESTAMP(3),

    CONSTRAINT "CustomerSubscription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "metadata" JSONB NOT NULL,
    "defaultPriceId" TEXT,
    "provider" "PaymentProvider" NOT NULL DEFAULT 'Stripe',

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Price" (
    "id" TEXT NOT NULL,
    "productId" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL,
    "currency" TEXT NOT NULL,
    "description" TEXT,
    "type" TEXT NOT NULL,
    "unitAmount" INTEGER,
    "interval" TEXT,
    "intervalCount" INTEGER,
    "metadata" JSONB NOT NULL,
    "provider" "PaymentProvider" NOT NULL DEFAULT 'Stripe',

    CONSTRAINT "Price_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Purchase" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "productId" TEXT,
    "priceId" TEXT,
    "status" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Purchase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserEngagement" (
    "userId" INTEGER NOT NULL,
    "targetUserId" INTEGER NOT NULL,
    "type" "UserEngagementType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserEngagement_pkey" PRIMARY KEY ("userId","targetUserId")
);

-- CreateTable
CREATE TABLE "UserMetric" (
    "userId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "followingCount" INTEGER NOT NULL DEFAULT 0,
    "followerCount" INTEGER NOT NULL DEFAULT 0,
    "reactionCount" INTEGER NOT NULL DEFAULT 0,
    "hiddenCount" INTEGER NOT NULL DEFAULT 0,
    "uploadCount" INTEGER NOT NULL DEFAULT 0,
    "reviewCount" INTEGER NOT NULL DEFAULT 0,
    "answerCount" INTEGER NOT NULL DEFAULT 0,
    "answerAcceptCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserMetric_pkey" PRIMARY KEY ("userId","timeframe")
);

-- CreateTable
CREATE TABLE "UserLink" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "type" "LinkType" NOT NULL,

    CONSTRAINT "UserLink_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "VerificationToken" (
    "identifier" TEXT NOT NULL,
    "token" TEXT NOT NULL,
    "expires" TIMESTAMP(3) NOT NULL
);

-- CreateTable
CREATE TABLE "Import" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "startedAt" TIMESTAMP(3),
    "finishedAt" TIMESTAMP(3),
    "source" TEXT NOT NULL,
    "status" "ImportStatus" NOT NULL DEFAULT 'Pending',
    "data" JSONB,
    "parentId" INTEGER,
    "importId" INTEGER,

    CONSTRAINT "Import_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Model" (
    "id" SERIAL NOT NULL,
    "name" CITEXT NOT NULL,
    "description" TEXT,
    "type" "ModelType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "lastVersionAt" TIMESTAMP(3),
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "tosViolation" BOOLEAN NOT NULL DEFAULT false,
    "poi" BOOLEAN NOT NULL DEFAULT false,
    "minor" BOOLEAN NOT NULL DEFAULT false,
    "userId" INTEGER NOT NULL,
    "status" "ModelStatus" NOT NULL DEFAULT 'Draft',
    "publishedAt" TIMESTAMP(3),
    "fromImportId" INTEGER,
    "meta" JSONB NOT NULL DEFAULT '{}',
    "deletedAt" TIMESTAMP(3),
    "deletedBy" INTEGER,
    "checkpointType" "CheckpointType",
    "uploadType" "ModelUploadType" NOT NULL DEFAULT 'Created',
    "locked" BOOLEAN NOT NULL DEFAULT false,
    "underAttack" BOOLEAN NOT NULL DEFAULT false,
    "earlyAccessDeadline" TIMESTAMP(3),
    "mode" "ModelModifier",
    "unlisted" BOOLEAN NOT NULL DEFAULT false,
    "gallerySettings" JSONB NOT NULL DEFAULT '{"users": [], "tags": [], "images": []}',
    "availability" "Availability" NOT NULL DEFAULT 'Public',
    "nsfwLevel" INTEGER NOT NULL DEFAULT 0,
    "lockedProperties" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "scannedAt" TIMESTAMP(3),
    "sfwOnly" BOOLEAN NOT NULL DEFAULT false,
    "allowNoCredit" BOOLEAN NOT NULL DEFAULT true,
    "allowCommercialUse" "CommercialUse"[] DEFAULT ARRAY['Sell']::"CommercialUse"[],
    "allowDerivatives" BOOLEAN NOT NULL DEFAULT true,
    "allowDifferentLicense" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "Model_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelFlag" (
    "modelId" INTEGER NOT NULL,
    "poi" BOOLEAN NOT NULL DEFAULT false,
    "minor" BOOLEAN NOT NULL DEFAULT false,
    "sfwOnly" BOOLEAN NOT NULL DEFAULT false,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "triggerWords" BOOLEAN NOT NULL DEFAULT false,
    "poiName" BOOLEAN NOT NULL DEFAULT false,
    "status" "ModelFlagStatus" NOT NULL DEFAULT 'Pending',
    "details" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModelFlag_pkey" PRIMARY KEY ("modelId")
);

-- CreateTable
CREATE TABLE "License" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,

    CONSTRAINT "License_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelInterest" (
    "userId" INTEGER NOT NULL,
    "modelId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModelInterest_pkey" PRIMARY KEY ("userId","modelId")
);

-- CreateTable
CREATE TABLE "ModelEngagement" (
    "userId" INTEGER NOT NULL,
    "modelId" INTEGER NOT NULL,
    "type" "ModelEngagementType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModelEngagement_pkey" PRIMARY KEY ("userId","modelId")
);

-- CreateTable
CREATE TABLE "ModelVersionSponsorshipSettings" (
    "id" SERIAL NOT NULL,
    "modelVersionMonetizationId" INTEGER NOT NULL,
    "type" "ModelVersionSponsorshipSettingsType" NOT NULL DEFAULT 'FixedPrice',
    "currency" "Currency" NOT NULL DEFAULT 'BUZZ',
    "unitAmount" INTEGER NOT NULL,

    CONSTRAINT "ModelVersionSponsorshipSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelVersionMonetization" (
    "id" SERIAL NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "type" "ModelVersionMonetizationType" NOT NULL DEFAULT 'PaidAccess',
    "currency" "Currency" NOT NULL DEFAULT 'BUZZ',
    "unitAmount" INTEGER,

    CONSTRAINT "ModelVersionMonetization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelVersion" (
    "id" SERIAL NOT NULL,
    "index" INTEGER,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "modelId" INTEGER NOT NULL,
    "trainedWords" TEXT[],
    "steps" INTEGER,
    "epochs" INTEGER,
    "clipSkip" INTEGER,
    "vaeId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "publishedAt" TIMESTAMP(3),
    "status" "ModelStatus" NOT NULL DEFAULT 'Draft',
    "trainingStatus" "TrainingStatus",
    "trainingDetails" JSONB,
    "fromImportId" INTEGER,
    "inaccurate" BOOLEAN NOT NULL DEFAULT false,
    "baseModel" TEXT NOT NULL,
    "baseModelType" TEXT,
    "meta" JSONB NOT NULL DEFAULT '{}',
    "requireAuth" BOOLEAN NOT NULL DEFAULT false,
    "settings" JSONB,
    "availability" "Availability" NOT NULL DEFAULT 'Public',
    "nsfwLevel" INTEGER NOT NULL DEFAULT 0,
    "earlyAccessEndsAt" TIMESTAMP(3),
    "earlyAccessConfig" JSONB,
    "uploadType" "ModelUploadType" NOT NULL DEFAULT 'Created',
    "usageControl" "ModelUsageControl" NOT NULL DEFAULT 'Download',
    "earlyAccessTimeFrame" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ModelVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelVersionEngagement" (
    "userId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "type" "ModelVersionEngagementType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModelVersionEngagement_pkey" PRIMARY KEY ("userId","modelVersionId")
);

-- CreateTable
CREATE TABLE "RecommendedResource" (
    "id" SERIAL NOT NULL,
    "resourceId" INTEGER NOT NULL,
    "sourceId" INTEGER,
    "settings" JSONB,

    CONSTRAINT "RecommendedResource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelFileHash" (
    "fileId" INTEGER NOT NULL,
    "type" "ModelHashType" NOT NULL,
    "hash" CITEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModelFileHash_pkey" PRIMARY KEY ("fileId","type")
);

-- CreateTable
CREATE TABLE "ModelFile" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "overrideName" TEXT,
    "url" TEXT NOT NULL,
    "sizeKB" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "type" TEXT NOT NULL DEFAULT 'Model',
    "modelVersionId" INTEGER NOT NULL,
    "pickleScanResult" "ScanResultCode" NOT NULL DEFAULT 'Pending',
    "exists" BOOLEAN,
    "pickleScanMessage" TEXT,
    "virusScanResult" "ScanResultCode" NOT NULL DEFAULT 'Pending',
    "virusScanMessage" TEXT,
    "scannedAt" TIMESTAMP(3),
    "scanRequestedAt" TIMESTAMP(3),
    "rawScanResult" JSONB,
    "metadata" JSONB,
    "headerData" JSONB,
    "visibility" "ModelFileVisibility" NOT NULL DEFAULT 'Public',
    "dataPurged" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ModelFile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "File" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "sizeKB" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "entityId" INTEGER NOT NULL,
    "entityType" TEXT NOT NULL,
    "metadata" JSONB,

    CONSTRAINT "File_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ModelMetric" (
    "modelId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "ratingCount" INTEGER NOT NULL DEFAULT 0,
    "downloadCount" INTEGER NOT NULL DEFAULT 0,
    "favoriteCount" INTEGER NOT NULL DEFAULT 0,
    "commentCount" INTEGER NOT NULL DEFAULT 0,
    "collectedCount" INTEGER NOT NULL DEFAULT 0,
    "imageCount" INTEGER NOT NULL DEFAULT 0,
    "tippedCount" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCount" INTEGER NOT NULL DEFAULT 0,
    "generationCount" INTEGER NOT NULL DEFAULT 0,
    "thumbsUpCount" INTEGER NOT NULL DEFAULT 0,
    "thumbsDownCount" INTEGER NOT NULL DEFAULT 0,
    "earnedAmount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModelMetric_pkey" PRIMARY KEY ("modelId","timeframe")
);

-- CreateTable
CREATE TABLE "ModelVersionMetric" (
    "modelVersionId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "rating" DOUBLE PRECISION NOT NULL DEFAULT 0,
    "ratingCount" INTEGER NOT NULL DEFAULT 0,
    "downloadCount" INTEGER NOT NULL DEFAULT 0,
    "favoriteCount" INTEGER NOT NULL DEFAULT 0,
    "commentCount" INTEGER NOT NULL DEFAULT 0,
    "collectedCount" INTEGER NOT NULL DEFAULT 0,
    "imageCount" INTEGER NOT NULL DEFAULT 0,
    "tippedCount" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCount" INTEGER NOT NULL DEFAULT 0,
    "generationCount" INTEGER NOT NULL DEFAULT 0,
    "thumbsUpCount" INTEGER NOT NULL DEFAULT 0,
    "thumbsDownCount" INTEGER NOT NULL DEFAULT 0,
    "earnedAmount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModelVersionMetric_pkey" PRIMARY KEY ("modelVersionId","timeframe")
);

-- CreateTable
CREATE TABLE "ModelMetricDaily" (
    "modelId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "count" INTEGER NOT NULL,

    CONSTRAINT "ModelMetricDaily_pkey" PRIMARY KEY ("modelId","modelVersionId","type","date")
);

-- CreateTable
CREATE TABLE "ModelAssociations" (
    "id" SERIAL NOT NULL,
    "fromModelId" INTEGER NOT NULL,
    "toModelId" INTEGER,
    "toArticleId" INTEGER,
    "associatedById" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "type" "AssociationType" NOT NULL,
    "index" INTEGER,

    CONSTRAINT "ModelAssociations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DownloadHistory" (
    "userId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "downloadAt" TIMESTAMP(3) NOT NULL,
    "hidden" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "DownloadHistory_pkey" PRIMARY KEY ("userId","modelVersionId")
);

-- CreateTable
CREATE TABLE "ModActivity" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "activity" TEXT NOT NULL,
    "entityType" TEXT,
    "entityId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ModActivity_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Report" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "reason" "ReportReason" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "details" JSONB,
    "internalNotes" TEXT,
    "previouslyReviewedCount" INTEGER NOT NULL DEFAULT 0,
    "alsoReportedBy" INTEGER[] DEFAULT ARRAY[]::INTEGER[],
    "status" "ReportStatus" NOT NULL,
    "statusSetAt" TIMESTAMP(3),
    "statusSetBy" INTEGER,

    CONSTRAINT "Report_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResourceReviewReport" (
    "resourceReviewId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "ResourceReviewReport_pkey" PRIMARY KEY ("reportId","resourceReviewId")
);

-- CreateTable
CREATE TABLE "ModelReport" (
    "modelId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "ModelReport_pkey" PRIMARY KEY ("reportId","modelId")
);

-- CreateTable
CREATE TABLE "CommentReport" (
    "commentId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "CommentReport_pkey" PRIMARY KEY ("reportId","commentId")
);

-- CreateTable
CREATE TABLE "CommentV2Report" (
    "commentV2Id" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "CommentV2Report_pkey" PRIMARY KEY ("reportId","commentV2Id")
);

-- CreateTable
CREATE TABLE "ImageReport" (
    "imageId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "ImageReport_pkey" PRIMARY KEY ("reportId","imageId")
);

-- CreateTable
CREATE TABLE "ArticleReport" (
    "articleId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "ArticleReport_pkey" PRIMARY KEY ("reportId","articleId")
);

-- CreateTable
CREATE TABLE "PostReport" (
    "postId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "PostReport_pkey" PRIMARY KEY ("reportId","postId")
);

-- CreateTable
CREATE TABLE "UserReport" (
    "userId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "UserReport_pkey" PRIMARY KEY ("reportId","userId")
);

-- CreateTable
CREATE TABLE "CollectionReport" (
    "collectionId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "CollectionReport_pkey" PRIMARY KEY ("reportId","collectionId")
);

-- CreateTable
CREATE TABLE "BountyReport" (
    "bountyId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "BountyReport_pkey" PRIMARY KEY ("reportId","bountyId")
);

-- CreateTable
CREATE TABLE "BountyEntryReport" (
    "bountyEntryId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "BountyEntryReport_pkey" PRIMARY KEY ("reportId","bountyEntryId")
);

-- CreateTable
CREATE TABLE "ChatReport" (
    "chatId" INTEGER NOT NULL,
    "reportId" INTEGER NOT NULL,

    CONSTRAINT "ChatReport_pkey" PRIMARY KEY ("reportId","chatId")
);

-- CreateTable
CREATE TABLE "ResourceReview" (
    "id" SERIAL NOT NULL,
    "modelId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "rating" INTEGER NOT NULL,
    "recommended" BOOLEAN NOT NULL DEFAULT true,
    "details" TEXT,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "exclude" BOOLEAN NOT NULL DEFAULT false,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "tosViolation" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB,

    CONSTRAINT "ResourceReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResourceReviewReaction" (
    "id" SERIAL NOT NULL,
    "reviewId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ResourceReviewReaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Post" (
    "id" SERIAL NOT NULL,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "title" TEXT,
    "detail" TEXT,
    "userId" INTEGER NOT NULL,
    "modelVersionId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "publishedAt" TIMESTAMP(3),
    "metadata" JSONB,
    "tosViolation" BOOLEAN NOT NULL DEFAULT false,
    "collectionId" INTEGER,
    "unlisted" BOOLEAN NOT NULL DEFAULT false,
    "availability" "Availability" NOT NULL DEFAULT 'Public',
    "nsfwLevel" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostMetric" (
    "postId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "likeCount" INTEGER NOT NULL DEFAULT 0,
    "dislikeCount" INTEGER NOT NULL DEFAULT 0,
    "laughCount" INTEGER NOT NULL DEFAULT 0,
    "cryCount" INTEGER NOT NULL DEFAULT 0,
    "heartCount" INTEGER NOT NULL DEFAULT 0,
    "commentCount" INTEGER NOT NULL DEFAULT 0,
    "collectedCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "ageGroup" "MetricTimeframe" NOT NULL DEFAULT 'Day',

    CONSTRAINT "PostMetric_pkey" PRIMARY KEY ("postId","timeframe")
);

-- CreateTable
CREATE TABLE "Image" (
    "id" SERIAL NOT NULL,
    "pHash" BIGINT,
    "name" TEXT,
    "url" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "meta" JSONB,
    "hash" TEXT,
    "height" INTEGER,
    "width" INTEGER,
    "type" "MediaType" NOT NULL DEFAULT 'image',
    "metadata" JSONB NOT NULL DEFAULT '{}',
    "nsfw" "NsfwLevel" NOT NULL DEFAULT 'None',
    "nsfwLevel" INTEGER NOT NULL DEFAULT 0,
    "nsfwLevelLocked" BOOLEAN NOT NULL DEFAULT false,
    "tosViolation" BOOLEAN NOT NULL DEFAULT false,
    "analysis" JSONB,
    "generationProcess" "ImageGenerationProcess",
    "featuredAt" TIMESTAMP(3),
    "postId" INTEGER,
    "needsReview" TEXT,
    "hideMeta" BOOLEAN NOT NULL DEFAULT false,
    "index" INTEGER,
    "scannedAt" TIMESTAMP(3),
    "scanRequestedAt" TIMESTAMP(3),
    "mimeType" TEXT,
    "sizeKB" INTEGER,
    "ingestion" "ImageIngestionStatus" NOT NULL DEFAULT 'Pending',
    "blockedFor" TEXT,
    "scanJobs" JSONB,
    "sortAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "minor" BOOLEAN NOT NULL DEFAULT false,
    "poi" BOOLEAN NOT NULL DEFAULT false,
    "acceptableMinor" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Image_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImagesOnReviews" (
    "imageId" INTEGER NOT NULL,
    "reviewId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,

    CONSTRAINT "ImagesOnReviews_pkey" PRIMARY KEY ("imageId","reviewId")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" SERIAL NOT NULL,
    "modelId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "text" TEXT NOT NULL,
    "rating" INTEGER NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImagesOnModels" (
    "imageId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "index" INTEGER,

    CONSTRAINT "ImagesOnModels_pkey" PRIMARY KEY ("imageId","modelVersionId")
);

-- CreateTable
CREATE TABLE "ImageFlag" (
    "imageId" INTEGER NOT NULL,
    "promptNsfw" BOOLEAN NOT NULL DEFAULT false,
    "resourcesNsfw" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ImageFlag_pkey" PRIMARY KEY ("imageId")
);

-- CreateTable
CREATE TABLE "BlockedImage" (
    "hash" BIGINT NOT NULL,
    "reason" "BlockImageReason" NOT NULL DEFAULT 'Ownership',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BlockedImage_pkey" PRIMARY KEY ("hash")
);

-- CreateTable
CREATE TABLE "ImageConnection" (
    "imageId" INTEGER NOT NULL,
    "entityId" INTEGER NOT NULL,
    "entityType" TEXT NOT NULL,

    CONSTRAINT "ImageConnection_pkey" PRIMARY KEY ("imageId","entityType","entityId")
);

-- CreateTable
CREATE TABLE "ImageEngagement" (
    "userId" INTEGER NOT NULL,
    "imageId" INTEGER NOT NULL,
    "type" "ImageEngagementType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ImageEngagement_pkey" PRIMARY KEY ("userId","imageId")
);

-- CreateTable
CREATE TABLE "ImageResource" (
    "id" SERIAL NOT NULL,
    "modelVersionId" INTEGER,
    "name" TEXT,
    "hash" TEXT,
    "imageId" INTEGER NOT NULL,
    "strength" INTEGER,
    "detected" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ImageResource_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImageResourceNew" (
    "imageId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "strength" INTEGER,
    "detected" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ImageResourceNew_pkey" PRIMARY KEY ("imageId","modelVersionId")
);

-- CreateTable
CREATE TABLE "ResourceOverride" (
    "hash" TEXT NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "type" "ModelHashType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ResourceOverride_pkey" PRIMARY KEY ("hash")
);

-- CreateTable
CREATE TABLE "ImageMetric" (
    "imageId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "likeCount" INTEGER NOT NULL DEFAULT 0,
    "dislikeCount" INTEGER NOT NULL DEFAULT 0,
    "laughCount" INTEGER NOT NULL DEFAULT 0,
    "cryCount" INTEGER NOT NULL DEFAULT 0,
    "heartCount" INTEGER NOT NULL DEFAULT 0,
    "commentCount" INTEGER NOT NULL DEFAULT 0,
    "collectedCount" INTEGER NOT NULL DEFAULT 0,
    "tippedCount" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCount" INTEGER NOT NULL DEFAULT 0,
    "viewCount" INTEGER NOT NULL DEFAULT 0,
    "reactionCount" INTEGER NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ImageMetric_pkey" PRIMARY KEY ("imageId","timeframe")
);

-- CreateTable
CREATE TABLE "ImageRatingRequest" (
    "userId" INTEGER NOT NULL,
    "imageId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nsfwLevel" INTEGER NOT NULL,
    "status" "ReportStatus" NOT NULL DEFAULT 'Pending',
    "weight" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "ImageRatingRequest_pkey" PRIMARY KEY ("imageId","userId")
);

-- CreateTable
CREATE TABLE "CollectionMetric" (
    "collectionId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "followerCount" INTEGER NOT NULL DEFAULT 0,
    "itemCount" INTEGER NOT NULL DEFAULT 0,
    "contributorCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CollectionMetric_pkey" PRIMARY KEY ("collectionId","timeframe")
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" SERIAL NOT NULL,
    "name" CITEXT NOT NULL,
    "color" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "target" "TagTarget"[],
    "type" "TagType" NOT NULL DEFAULT 'UserGenerated',
    "nsfw" "NsfwLevel" NOT NULL DEFAULT 'None',
    "nsfwLevel" INTEGER NOT NULL DEFAULT 1,
    "unlisted" BOOLEAN NOT NULL DEFAULT false,
    "unfeatured" BOOLEAN NOT NULL DEFAULT false,
    "isCategory" BOOLEAN NOT NULL DEFAULT false,
    "adminOnly" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TagsOnTags" (
    "fromTagId" INTEGER NOT NULL,
    "toTagId" INTEGER NOT NULL,
    "type" "TagsOnTagsType" NOT NULL DEFAULT 'Parent',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TagsOnTags_pkey" PRIMARY KEY ("fromTagId","toTagId")
);

-- CreateTable
CREATE TABLE "TagsOnModels" (
    "modelId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TagsOnModels_pkey" PRIMARY KEY ("modelId","tagId")
);

-- CreateTable
CREATE TABLE "TagsOnModelsVote" (
    "modelId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "vote" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TagsOnModelsVote_pkey" PRIMARY KEY ("tagId","modelId","userId")
);

-- CreateTable
CREATE TABLE "TagsOnQuestions" (
    "questionId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,

    CONSTRAINT "TagsOnQuestions_pkey" PRIMARY KEY ("tagId","questionId")
);

-- CreateTable
CREATE TABLE "TagsOnImageNew" (
    "imageId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "attributes" SMALLINT NOT NULL,

    CONSTRAINT "TagsOnImageNew_pkey" PRIMARY KEY ("imageId","tagId")
);

-- CreateTable
CREATE TABLE "ShadowTagsOnImage" (
    "imageId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "confidence" INTEGER NOT NULL,

    CONSTRAINT "ShadowTagsOnImage_pkey" PRIMARY KEY ("imageId","tagId")
);

-- CreateTable
CREATE TABLE "TagsOnImageVote" (
    "imageId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "vote" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "applied" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "TagsOnImageVote_pkey" PRIMARY KEY ("tagId","imageId","userId")
);

-- CreateTable
CREATE TABLE "TagsOnPost" (
    "postId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "confidence" INTEGER,
    "disabled" BOOLEAN NOT NULL DEFAULT false,
    "needsReview" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "TagsOnPost_pkey" PRIMARY KEY ("tagId","postId")
);

-- CreateTable
CREATE TABLE "TagsOnArticle" (
    "articleId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TagsOnArticle_pkey" PRIMARY KEY ("tagId","articleId")
);

-- CreateTable
CREATE TABLE "TagsOnBounty" (
    "bountyId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TagsOnBounty_pkey" PRIMARY KEY ("tagId","bountyId")
);

-- CreateTable
CREATE TABLE "TagsOnPostVote" (
    "postId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "vote" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TagsOnPostVote_pkey" PRIMARY KEY ("tagId","postId","userId")
);

-- CreateTable
CREATE TABLE "TagMetric" (
    "tagId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "modelCount" INTEGER NOT NULL DEFAULT 0,
    "imageCount" INTEGER NOT NULL DEFAULT 0,
    "postCount" INTEGER NOT NULL DEFAULT 0,
    "articleCount" INTEGER NOT NULL DEFAULT 0,
    "hiddenCount" INTEGER NOT NULL DEFAULT 0,
    "followerCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TagMetric_pkey" PRIMARY KEY ("tagId","timeframe")
);

-- CreateTable
CREATE TABLE "SavedModel" (
    "modelId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SavedModel_pkey" PRIMARY KEY ("modelId","userId")
);

-- CreateTable
CREATE TABLE "RunStrategy" (
    "modelVersionId" INTEGER NOT NULL,
    "partnerId" INTEGER NOT NULL,
    "url" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RunStrategy_pkey" PRIMARY KEY ("modelVersionId","partnerId")
);

-- CreateTable
CREATE TABLE "Partner" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "homepage" TEXT,
    "tos" TEXT,
    "privacy" TEXT,
    "startupTime" INTEGER,
    "onDemand" BOOLEAN NOT NULL,
    "onDemandStrategy" TEXT,
    "onDemandTypes" "ModelType"[] DEFAULT ARRAY[]::"ModelType"[],
    "onDemandBaseModels" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "stepsPerSecond" INTEGER NOT NULL,
    "pricingModel" "PartnerPricingModel" NOT NULL,
    "price" TEXT NOT NULL,
    "about" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "poi" BOOLEAN NOT NULL DEFAULT false,
    "personal" BOOLEAN NOT NULL DEFAULT false,
    "token" TEXT,
    "tier" INTEGER NOT NULL DEFAULT 0,
    "logo" TEXT,
    "disabled" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Partner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KeyValue" (
    "key" TEXT NOT NULL,
    "value" JSONB NOT NULL,

    CONSTRAINT "KeyValue_pkey" PRIMARY KEY ("key")
);

-- CreateTable
CREATE TABLE "ApiKey" (
    "id" SERIAL NOT NULL,
    "key" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "scope" "KeyScope"[],
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "type" "ApiKeyType" NOT NULL DEFAULT 'User',
    "expiresAt" TIMESTAMP(3),

    CONSTRAINT "ApiKey_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdToken" (
    "id" SERIAL NOT NULL,
    "token" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiresAt" TIMESTAMP(3),

    CONSTRAINT "AdToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Comment" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "tosViolation" BOOLEAN NOT NULL DEFAULT false,
    "parentId" INTEGER,
    "userId" INTEGER NOT NULL,
    "modelId" INTEGER NOT NULL,
    "locked" BOOLEAN DEFAULT false,
    "hidden" BOOLEAN DEFAULT false,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CommentReaction" (
    "id" SERIAL NOT NULL,
    "commentId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CommentReaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserNotificationSettings" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "type" TEXT NOT NULL,
    "disabledAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserNotificationSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Webhook" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "notifyOn" TEXT[],
    "active" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "userId" INTEGER NOT NULL,

    CONSTRAINT "Webhook_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Question" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" CITEXT NOT NULL,
    "content" TEXT NOT NULL,
    "selectedAnswerId" INTEGER,

    CONSTRAINT "Question_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuestionMetric" (
    "questionId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "heartCount" INTEGER NOT NULL DEFAULT 0,
    "commentCount" INTEGER NOT NULL DEFAULT 0,
    "answerCount" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "QuestionMetric_pkey" PRIMARY KEY ("questionId","timeframe")
);

-- CreateTable
CREATE TABLE "Answer" (
    "id" SERIAL NOT NULL,
    "questionId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Answer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AnswerVote" (
    "answerId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "vote" BOOLEAN,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AnswerVote_pkey" PRIMARY KEY ("answerId","userId")
);

-- CreateTable
CREATE TABLE "AnswerMetric" (
    "answerId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "checkCount" INTEGER NOT NULL,
    "crossCount" INTEGER NOT NULL,
    "heartCount" INTEGER NOT NULL,
    "commentCount" INTEGER NOT NULL,

    CONSTRAINT "AnswerMetric_pkey" PRIMARY KEY ("answerId","timeframe")
);

-- CreateTable
CREATE TABLE "CommentV2" (
    "id" SERIAL NOT NULL,
    "content" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "tosViolation" BOOLEAN NOT NULL DEFAULT false,
    "userId" INTEGER NOT NULL,
    "threadId" INTEGER NOT NULL,
    "metadata" JSONB,
    "hidden" BOOLEAN DEFAULT false,
    "pinnedAt" TIMESTAMP(3),

    CONSTRAINT "CommentV2_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Thread" (
    "id" SERIAL NOT NULL,
    "locked" BOOLEAN NOT NULL DEFAULT false,
    "parentThreadId" INTEGER,
    "rootThreadId" INTEGER,
    "questionId" INTEGER,
    "answerId" INTEGER,
    "imageId" INTEGER,
    "postId" INTEGER,
    "reviewId" INTEGER,
    "commentId" INTEGER,
    "modelId" INTEGER,
    "articleId" INTEGER,
    "bountyId" INTEGER,
    "bountyEntryId" INTEGER,
    "clubPostId" INTEGER,
    "metadata" JSONB NOT NULL DEFAULT '{}',

    CONSTRAINT "Thread_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuestionReaction" (
    "id" SERIAL NOT NULL,
    "questionId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QuestionReaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AnswerReaction" (
    "id" SERIAL NOT NULL,
    "answerId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AnswerReaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CommentV2Reaction" (
    "id" SERIAL NOT NULL,
    "commentId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CommentV2Reaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImageReaction" (
    "id" SERIAL NOT NULL,
    "imageId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ImageReaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PostReaction" (
    "id" SERIAL NOT NULL,
    "postId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PostReaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArticleReaction" (
    "id" SERIAL NOT NULL,
    "articleId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ArticleReaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TagEngagement" (
    "userId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "type" "TagEngagementType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "TagEngagement_pkey" PRIMARY KEY ("userId","tagId")
);

-- CreateTable
CREATE TABLE "Announcement" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "emoji" TEXT,
    "color" TEXT NOT NULL DEFAULT 'blue',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "startsAt" TIMESTAMP(3),
    "endsAt" TIMESTAMP(3),
    "metadata" JSONB,
    "disabled" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Announcement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Cosmetic" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "videoUrl" TEXT,
    "type" "CosmeticType" NOT NULL,
    "source" "CosmeticSource" NOT NULL,
    "permanentUnlock" BOOLEAN NOT NULL,
    "data" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "availableStart" TIMESTAMP(3),
    "availableEnd" TIMESTAMP(3),
    "availableQuery" TEXT,
    "productId" TEXT,
    "leaderboardId" TEXT,
    "leaderboardPosition" INTEGER,

    CONSTRAINT "Cosmetic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserCosmetic" (
    "userId" INTEGER NOT NULL,
    "cosmeticId" INTEGER NOT NULL,
    "obtainedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "equippedAt" TIMESTAMP(3),
    "data" JSONB,
    "claimKey" TEXT NOT NULL DEFAULT 'claimed',
    "equippedToId" INTEGER,
    "equippedToType" "CosmeticEntity",
    "forId" INTEGER,
    "forType" "CosmeticEntity",

    CONSTRAINT "UserCosmetic_pkey" PRIMARY KEY ("userId","cosmeticId","claimKey")
);

-- CreateTable
CREATE TABLE "CosmeticShopSection" (
    "id" SERIAL NOT NULL,
    "addedById" INTEGER,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "placement" INTEGER NOT NULL DEFAULT 0,
    "meta" JSONB NOT NULL DEFAULT '{}',
    "imageId" INTEGER,
    "published" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "CosmeticShopSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CosmeticShopItem" (
    "id" SERIAL NOT NULL,
    "cosmeticId" INTEGER NOT NULL,
    "unitAmount" INTEGER NOT NULL,
    "addedById" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "availableFrom" TIMESTAMP(3),
    "availableTo" TIMESTAMP(3),
    "availableQuantity" INTEGER,
    "meta" JSONB NOT NULL DEFAULT '{}',
    "title" TEXT NOT NULL,
    "description" TEXT,
    "archivedAt" TIMESTAMP(3),

    CONSTRAINT "CosmeticShopItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CosmeticShopSectionItem" (
    "shopItemId" INTEGER NOT NULL,
    "shopSectionId" INTEGER NOT NULL,
    "index" INTEGER NOT NULL DEFAULT 0,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CosmeticShopSectionItem_pkey" PRIMARY KEY ("shopItemId","shopSectionId")
);

-- CreateTable
CREATE TABLE "UserCosmeticShopPurchases" (
    "userId" INTEGER NOT NULL,
    "cosmeticId" INTEGER NOT NULL,
    "shopItemId" INTEGER NOT NULL,
    "unitAmount" INTEGER NOT NULL,
    "purchasedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "buzzTransactionId" TEXT NOT NULL,
    "refunded" BOOLEAN NOT NULL,

    CONSTRAINT "UserCosmeticShopPurchases_pkey" PRIMARY KEY ("buzzTransactionId")
);

-- CreateTable
CREATE TABLE "BuzzClaim" (
    "key" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "transactionIdQuery" TEXT NOT NULL,
    "amount" INTEGER NOT NULL,
    "availableStart" TIMESTAMP(3),
    "availableEnd" TIMESTAMP(3),
    "claimed" INTEGER NOT NULL DEFAULT 0,
    "limit" INTEGER,
    "accountType" "BuzzAccountType" NOT NULL DEFAULT 'user',
    "useMultiplier" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "BuzzClaim_pkey" PRIMARY KEY ("key")
);

-- CreateTable
CREATE TABLE "Article" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "tosViolation" BOOLEAN NOT NULL DEFAULT false,
    "metadata" JSONB,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "cover" TEXT,
    "coverId" INTEGER,
    "publishedAt" TIMESTAMP(3),
    "userId" INTEGER NOT NULL,
    "availability" "Availability" NOT NULL DEFAULT 'Public',
    "unlisted" BOOLEAN NOT NULL DEFAULT false,
    "nsfwLevel" INTEGER NOT NULL DEFAULT 0,
    "userNsfwLevel" INTEGER NOT NULL DEFAULT 0,
    "lockedProperties" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "status" "ArticleStatus" NOT NULL DEFAULT 'Draft',

    CONSTRAINT "Article_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PressMention" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "source" TEXT NOT NULL,
    "publishedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PressMention_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ArticleEngagement" (
    "userId" INTEGER NOT NULL,
    "articleId" INTEGER NOT NULL,
    "type" "ArticleEngagementType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ArticleEngagement_pkey" PRIMARY KEY ("userId","articleId")
);

-- CreateTable
CREATE TABLE "ArticleMetric" (
    "articleId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "likeCount" INTEGER NOT NULL DEFAULT 0,
    "dislikeCount" INTEGER NOT NULL DEFAULT 0,
    "laughCount" INTEGER NOT NULL DEFAULT 0,
    "cryCount" INTEGER NOT NULL DEFAULT 0,
    "heartCount" INTEGER NOT NULL DEFAULT 0,
    "commentCount" INTEGER NOT NULL DEFAULT 0,
    "viewCount" INTEGER NOT NULL DEFAULT 0,
    "favoriteCount" INTEGER NOT NULL DEFAULT 0,
    "hideCount" INTEGER NOT NULL DEFAULT 0,
    "collectedCount" INTEGER NOT NULL DEFAULT 0,
    "tippedCount" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ArticleMetric_pkey" PRIMARY KEY ("articleId","timeframe")
);

-- CreateTable
CREATE TABLE "Leaderboard" (
    "id" TEXT NOT NULL,
    "index" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "scoringDescription" TEXT NOT NULL,
    "query" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL,
    "public" BOOLEAN NOT NULL,

    CONSTRAINT "Leaderboard_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LeaderboardResult" (
    "leaderboardId" TEXT NOT NULL,
    "date" DATE NOT NULL,
    "position" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "score" INTEGER NOT NULL DEFAULT 0,
    "metrics" JSONB NOT NULL DEFAULT '{}',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "LeaderboardResult_pkey" PRIMARY KEY ("leaderboardId","date","position")
);

-- CreateTable
CREATE TABLE "ModelVersionExploration" (
    "index" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "prompt" TEXT NOT NULL,
    "modelVersionId" INTEGER NOT NULL,

    CONSTRAINT "ModelVersionExploration_pkey" PRIMARY KEY ("modelVersionId","name")
);

-- CreateTable
CREATE TABLE "GenerationServiceProvider" (
    "name" TEXT NOT NULL,
    "schedulers" "GenerationSchedulers"[],

    CONSTRAINT "GenerationServiceProvider_pkey" PRIMARY KEY ("name")
);

-- CreateTable
CREATE TABLE "Collection" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "name" TEXT NOT NULL,
    "description" TEXT,
    "nsfw" BOOLEAN DEFAULT false,
    "userId" INTEGER NOT NULL,
    "imageId" INTEGER,
    "write" "CollectionWriteConfiguration" NOT NULL DEFAULT 'Private',
    "read" "CollectionReadConfiguration" NOT NULL DEFAULT 'Private',
    "type" "CollectionType",
    "mode" "CollectionMode",
    "metadata" JSONB NOT NULL DEFAULT '{}',
    "availability" "Availability" NOT NULL DEFAULT 'Public',
    "nsfwLevel" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "Collection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CollectionItem" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "collectionId" INTEGER NOT NULL,
    "articleId" INTEGER,
    "postId" INTEGER,
    "imageId" INTEGER,
    "modelId" INTEGER,
    "addedById" INTEGER,
    "reviewedById" INTEGER,
    "reviewedAt" TIMESTAMP(3),
    "note" TEXT,
    "status" "CollectionItemStatus" NOT NULL DEFAULT 'ACCEPTED',
    "randomId" INTEGER,
    "tagId" INTEGER,

    CONSTRAINT "CollectionItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CollectionItemScore" (
    "userId" INTEGER NOT NULL,
    "collectionItemId" INTEGER NOT NULL,
    "score" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CollectionItemScore_pkey" PRIMARY KEY ("userId","collectionItemId")
);

-- CreateTable
CREATE TABLE "CollectionContributor" (
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "userId" INTEGER NOT NULL,
    "collectionId" INTEGER NOT NULL,
    "permissions" "CollectionContributorPermission"[],

    CONSTRAINT "CollectionContributor_pkey" PRIMARY KEY ("userId","collectionId")
);

-- CreateTable
CREATE TABLE "TagsOnCollection" (
    "collectionId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "filterableOnly" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "TagsOnCollection_pkey" PRIMARY KEY ("tagId","collectionId")
);

-- CreateTable
CREATE TABLE "HomeBlock" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "userId" INTEGER NOT NULL,
    "metadata" JSONB NOT NULL DEFAULT '{}',
    "index" INTEGER,
    "type" "HomeBlockType" NOT NULL,
    "permanent" BOOLEAN NOT NULL DEFAULT false,
    "sourceId" INTEGER,

    CONSTRAINT "HomeBlock_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BuzzTip" (
    "entityType" TEXT NOT NULL,
    "entityId" INTEGER NOT NULL,
    "toUserId" INTEGER NOT NULL,
    "fromUserId" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BuzzTip_pkey" PRIMARY KEY ("entityType","entityId","fromUserId")
);

-- CreateTable
CREATE TABLE "Bounty" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startsAt" DATE NOT NULL,
    "expiresAt" DATE NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "details" JSONB,
    "mode" "BountyMode" NOT NULL DEFAULT 'Individual',
    "entryMode" "BountyEntryMode" NOT NULL DEFAULT 'Open',
    "type" "BountyType" NOT NULL,
    "minBenefactorUnitAmount" INTEGER NOT NULL,
    "maxBenefactorUnitAmount" INTEGER,
    "entryLimit" INTEGER NOT NULL DEFAULT 1,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "poi" BOOLEAN NOT NULL DEFAULT false,
    "complete" BOOLEAN NOT NULL DEFAULT false,
    "refunded" BOOLEAN NOT NULL DEFAULT false,
    "availability" "Availability" NOT NULL DEFAULT 'Public',
    "nsfwLevel" INTEGER NOT NULL DEFAULT 0,
    "lockedProperties" TEXT[] DEFAULT ARRAY[]::TEXT[],

    CONSTRAINT "Bounty_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BountyEntry" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "bountyId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "locked" BOOLEAN NOT NULL DEFAULT false,
    "description" TEXT,
    "nsfwLevel" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "BountyEntry_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BountyEntryReaction" (
    "bountyEntryId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BountyEntryReaction_pkey" PRIMARY KEY ("bountyEntryId","userId","reaction")
);

-- CreateTable
CREATE TABLE "BountyBenefactor" (
    "userId" INTEGER NOT NULL,
    "bountyId" INTEGER NOT NULL,
    "unitAmount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "awardedAt" TIMESTAMP(3),
    "awardedToId" INTEGER,
    "currency" "Currency" NOT NULL DEFAULT 'BUZZ',

    CONSTRAINT "BountyBenefactor_pkey" PRIMARY KEY ("bountyId","userId")
);

-- CreateTable
CREATE TABLE "BountyEngagement" (
    "userId" INTEGER NOT NULL,
    "bountyId" INTEGER NOT NULL,
    "type" "BountyEngagementType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BountyEngagement_pkey" PRIMARY KEY ("type","bountyId","userId")
);

-- CreateTable
CREATE TABLE "TipConnection" (
    "transactionId" TEXT NOT NULL,
    "entityId" INTEGER NOT NULL,
    "entityType" TEXT NOT NULL,

    CONSTRAINT "TipConnection_pkey" PRIMARY KEY ("entityType","entityId","transactionId")
);

-- CreateTable
CREATE TABLE "BountyMetric" (
    "bountyId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "favoriteCount" INTEGER NOT NULL DEFAULT 0,
    "trackCount" INTEGER NOT NULL DEFAULT 0,
    "entryCount" INTEGER NOT NULL DEFAULT 0,
    "benefactorCount" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCount" INTEGER NOT NULL DEFAULT 0,
    "commentCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BountyMetric_pkey" PRIMARY KEY ("bountyId","timeframe")
);

-- CreateTable
CREATE TABLE "BountyEntryMetric" (
    "bountyEntryId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "likeCount" INTEGER NOT NULL DEFAULT 0,
    "dislikeCount" INTEGER NOT NULL DEFAULT 0,
    "laughCount" INTEGER NOT NULL DEFAULT 0,
    "cryCount" INTEGER NOT NULL DEFAULT 0,
    "heartCount" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCount" INTEGER NOT NULL DEFAULT 0,
    "tippedCount" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCount" INTEGER NOT NULL DEFAULT 0,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BountyEntryMetric_pkey" PRIMARY KEY ("bountyEntryId","timeframe")
);

-- CreateTable
CREATE TABLE "CsamReport" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "reportedById" INTEGER NOT NULL,
    "reportSentAt" TIMESTAMP(3),
    "archivedAt" TIMESTAMP(3),
    "contentRemovedAt" TIMESTAMP(3),
    "reportId" INTEGER,
    "details" JSONB NOT NULL DEFAULT '{}',
    "images" JSONB NOT NULL DEFAULT '[]',
    "type" "CsamReportType" NOT NULL DEFAULT 'Image',

    CONSTRAINT "CsamReport_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Link" (
    "id" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "type" "LinkType" NOT NULL,
    "entityId" INTEGER NOT NULL,
    "entityType" TEXT NOT NULL,

    CONSTRAINT "Link_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EntityAccess" (
    "accessToId" INTEGER NOT NULL,
    "accessToType" TEXT NOT NULL,
    "accessorId" INTEGER NOT NULL,
    "accessorType" TEXT NOT NULL,
    "addedById" INTEGER NOT NULL,
    "addedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "permissions" INTEGER NOT NULL DEFAULT 0,
    "meta" JSONB DEFAULT '{}',

    CONSTRAINT "EntityAccess_pkey" PRIMARY KEY ("accessToId","accessToType","accessorId","accessorType")
);

-- CreateTable
CREATE TABLE "EntityCollaborator" (
    "entityType" "EntityType" NOT NULL,
    "entityId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "status" "EntityCollaboratorStatus" NOT NULL DEFAULT 'Pending',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "createdBy" INTEGER NOT NULL,
    "lastMessageSentAt" TIMESTAMP(3),

    CONSTRAINT "EntityCollaborator_pkey" PRIMARY KEY ("entityType","entityId","userId")
);

-- CreateTable
CREATE TABLE "EcosystemCheckpoints" (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "EcosystemCheckpoints_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GenerationBaseModel" (
    "baseModel" TEXT NOT NULL,

    CONSTRAINT "GenerationBaseModel_pkey" PRIMARY KEY ("baseModel")
);

-- CreateTable
CREATE TABLE "Club" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "coverImageId" INTEGER,
    "headerImageId" INTEGER,
    "avatarId" INTEGER,
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "billing" BOOLEAN NOT NULL DEFAULT true,
    "unlisted" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Club_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClubTier" (
    "id" SERIAL NOT NULL,
    "clubId" INTEGER NOT NULL,
    "unitAmount" INTEGER NOT NULL,
    "currency" "Currency" NOT NULL DEFAULT 'BUZZ',
    "name" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "coverImageId" INTEGER,
    "unlisted" BOOLEAN NOT NULL DEFAULT false,
    "joinable" BOOLEAN NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "memberLimit" INTEGER,
    "oneTimeFee" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ClubTier_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClubAdminInvite" (
    "id" TEXT NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "clubId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "permissions" "ClubAdminPermission"[],

    CONSTRAINT "ClubAdminInvite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClubAdmin" (
    "userId" INTEGER NOT NULL,
    "clubId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "permissions" "ClubAdminPermission"[],

    CONSTRAINT "ClubAdmin_pkey" PRIMARY KEY ("clubId","userId")
);

-- CreateTable
CREATE TABLE "ClubMembership" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "clubId" INTEGER NOT NULL,
    "clubTierId" INTEGER NOT NULL,
    "startedAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "cancelledAt" TIMESTAMP(3),
    "nextBillingAt" TIMESTAMP(3) NOT NULL,
    "unitAmount" INTEGER NOT NULL,
    "currency" "Currency" NOT NULL DEFAULT 'BUZZ',
    "downgradeClubTierId" INTEGER,
    "billingPausedAt" TIMESTAMP(3),

    CONSTRAINT "ClubMembership_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClubMembershipCharge" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "clubId" INTEGER NOT NULL,
    "clubTierId" INTEGER NOT NULL,
    "chargedAt" TIMESTAMP(3) NOT NULL,
    "status" TEXT,
    "invoiceId" TEXT,
    "unitAmount" INTEGER NOT NULL,
    "unitAmountPurchased" INTEGER NOT NULL,
    "currency" "Currency" NOT NULL DEFAULT 'BUZZ',

    CONSTRAINT "ClubMembershipCharge_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClubPost" (
    "id" SERIAL NOT NULL,
    "clubId" INTEGER NOT NULL,
    "createdById" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "membersOnly" BOOLEAN NOT NULL,
    "title" TEXT,
    "description" TEXT,
    "coverImageId" INTEGER,
    "entityId" INTEGER,
    "entityType" TEXT,

    CONSTRAINT "ClubPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClubPostReaction" (
    "id" SERIAL NOT NULL,
    "clubPostId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "reaction" "ReviewReactions" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ClubPostReaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ClubPostMetric" (
    "clubPostId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "likeCount" INTEGER NOT NULL DEFAULT 0,
    "dislikeCount" INTEGER NOT NULL DEFAULT 0,
    "laughCount" INTEGER NOT NULL DEFAULT 0,
    "cryCount" INTEGER NOT NULL DEFAULT 0,
    "heartCount" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ClubPostMetric_pkey" PRIMARY KEY ("clubPostId","timeframe")
);

-- CreateTable
CREATE TABLE "ClubMetric" (
    "clubId" INTEGER NOT NULL,
    "timeframe" "MetricTimeframe" NOT NULL,
    "memberCount" INTEGER NOT NULL DEFAULT 0,
    "clubPostCount" INTEGER NOT NULL DEFAULT 0,
    "resourceCount" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ClubMetric_pkey" PRIMARY KEY ("clubId","timeframe")
);

-- CreateTable
CREATE TABLE "Chat" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "hash" TEXT NOT NULL,
    "ownerId" INTEGER NOT NULL,

    CONSTRAINT "Chat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChatMember" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "chatId" INTEGER NOT NULL,
    "isOwner" BOOLEAN NOT NULL DEFAULT false,
    "isMuted" BOOLEAN NOT NULL DEFAULT false,
    "status" "ChatMemberStatus" NOT NULL,
    "lastViewedMessageId" INTEGER,
    "joinedAt" TIMESTAMP(3),
    "ignoredAt" TIMESTAMP(3),
    "leftAt" TIMESTAMP(3),
    "kickedAt" TIMESTAMP(3),
    "unkickedAt" TIMESTAMP(3),

    CONSTRAINT "ChatMember_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ChatMessage" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" INTEGER NOT NULL,
    "chatId" INTEGER NOT NULL,
    "content" TEXT NOT NULL,
    "contentType" "ChatMessageType" NOT NULL DEFAULT 'Markdown',
    "referenceMessageId" INTEGER,
    "editedAt" TIMESTAMP(3),

    CONSTRAINT "ChatMessage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BuildGuide" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" TEXT NOT NULL,
    "message" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "components" JSONB NOT NULL,
    "capabilities" JSONB NOT NULL,

    CONSTRAINT "BuildGuide_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PurchasableReward" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "title" TEXT NOT NULL,
    "unitPrice" INTEGER NOT NULL,
    "about" TEXT NOT NULL,
    "redeemDetails" TEXT NOT NULL,
    "termsOfUse" TEXT NOT NULL,
    "usage" "PurchasableRewardUsage" NOT NULL,
    "codes" TEXT[],
    "archived" BOOLEAN NOT NULL DEFAULT false,
    "availableFrom" TIMESTAMP(3),
    "availableTo" TIMESTAMP(3),
    "availableCount" INTEGER,
    "addedById" INTEGER,
    "coverImageId" INTEGER,

    CONSTRAINT "PurchasableReward_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserPurchasedRewards" (
    "buzzTransactionId" TEXT NOT NULL,
    "userId" INTEGER,
    "purchasableRewardId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "meta" JSONB NOT NULL DEFAULT '{}',
    "code" TEXT NOT NULL,

    CONSTRAINT "UserPurchasedRewards_pkey" PRIMARY KEY ("buzzTransactionId")
);

-- CreateTable
CREATE TABLE "JobQueue" (
    "type" "JobQueueType" NOT NULL,
    "entityType" "EntityType" NOT NULL,
    "entityId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "JobQueue_pkey" PRIMARY KEY ("entityType","entityId","type")
);

-- CreateTable
CREATE TABLE "VaultItem" (
    "id" SERIAL NOT NULL,
    "vaultId" INTEGER NOT NULL,
    "status" "VaultItemStatus" NOT NULL DEFAULT 'Pending',
    "files" JSONB NOT NULL DEFAULT '[]',
    "modelVersionId" INTEGER NOT NULL,
    "modelId" INTEGER NOT NULL,
    "modelName" TEXT NOT NULL,
    "versionName" TEXT NOT NULL,
    "creatorId" INTEGER,
    "creatorName" TEXT NOT NULL,
    "type" "ModelType" NOT NULL,
    "baseModel" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "addedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "refreshedAt" TIMESTAMP(3),
    "modelSizeKb" INTEGER NOT NULL,
    "detailsSizeKb" INTEGER NOT NULL,
    "imagesSizeKb" INTEGER NOT NULL,
    "notes" TEXT,
    "meta" JSONB NOT NULL DEFAULT '{}',

    CONSTRAINT "VaultItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Vault" (
    "userId" INTEGER NOT NULL,
    "storageKb" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "meta" JSONB NOT NULL DEFAULT '{}',

    CONSTRAINT "Vault_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "RedeemableCode" (
    "code" TEXT NOT NULL,
    "unitValue" INTEGER NOT NULL,
    "userId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "type" "RedeemableCodeType" NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "redeemedAt" TIMESTAMP(3),
    "transactionId" TEXT,

    CONSTRAINT "RedeemableCode_pkey" PRIMARY KEY ("code")
);

-- CreateTable
CREATE TABLE "Tool" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "icon" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "unlisted" BOOLEAN NOT NULL DEFAULT false,
    "type" "ToolType" NOT NULL,
    "domain" TEXT,
    "priority" INTEGER,
    "description" TEXT,
    "supported" BOOLEAN NOT NULL DEFAULT false,
    "company" TEXT,
    "metadata" JSONB NOT NULL DEFAULT '{}',
    "alias" TEXT,

    CONSTRAINT "Tool_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImageTool" (
    "imageId" INTEGER NOT NULL,
    "toolId" INTEGER NOT NULL,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ImageTool_pkey" PRIMARY KEY ("imageId","toolId")
);

-- CreateTable
CREATE TABLE "Technique" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "type" "TechniqueType" NOT NULL,

    CONSTRAINT "Technique_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ImageTechnique" (
    "imageId" INTEGER NOT NULL,
    "techniqueId" INTEGER NOT NULL,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ImageTechnique_pkey" PRIMARY KEY ("imageId","techniqueId")
);

-- CreateTable
CREATE TABLE "DonationGoal" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "goalAmount" INTEGER NOT NULL,
    "paidAmount" INTEGER NOT NULL DEFAULT 0,
    "modelVersionId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "isEarlyAccess" BOOLEAN NOT NULL DEFAULT false,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "DonationGoal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Donation" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "donationGoalId" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "buzzTransactionId" TEXT NOT NULL,
    "notes" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Donation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Blocklist" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "type" TEXT NOT NULL,
    "data" TEXT[],

    CONSTRAINT "Blocklist_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Appeal" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "entityType" "EntityType" NOT NULL,
    "entityId" INTEGER NOT NULL,
    "status" "AppealStatus" NOT NULL DEFAULT 'Pending',
    "appealMessage" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "resolvedAt" TIMESTAMP(3),
    "resolvedBy" INTEGER,
    "resolvedMessage" TEXT,
    "internalNotes" TEXT,
    "buzzTransactionId" TEXT,

    CONSTRAINT "Appeal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuctionBase" (
    "id" SERIAL NOT NULL,
    "type" "AuctionType" NOT NULL,
    "ecosystem" TEXT,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "minPrice" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,
    "runForDays" INTEGER NOT NULL DEFAULT 1,
    "validForDays" INTEGER NOT NULL DEFAULT 1,
    "description" TEXT,

    CONSTRAINT "AuctionBase_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Auction" (
    "id" SERIAL NOT NULL,
    "auctionBaseId" INTEGER NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "endAt" TIMESTAMP(3) NOT NULL,
    "quantity" INTEGER NOT NULL,
    "minPrice" INTEGER NOT NULL,
    "validFrom" TIMESTAMP(3) NOT NULL,
    "validTo" TIMESTAMP(3) NOT NULL,
    "finalized" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Auction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Bid" (
    "id" SERIAL NOT NULL,
    "auctionId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "entityId" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deleted" BOOLEAN NOT NULL DEFAULT false,
    "transactionIds" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "isRefunded" BOOLEAN NOT NULL DEFAULT false,
    "fromRecurring" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Bid_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BidRecurring" (
    "id" SERIAL NOT NULL,
    "auctionBaseId" INTEGER NOT NULL,
    "userId" INTEGER NOT NULL,
    "entityId" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "startAt" TIMESTAMP(3) NOT NULL,
    "endAt" TIMESTAMP(3),
    "isPaused" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "BidRecurring_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FeaturedModelVersion" (
    "id" SERIAL NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "validFrom" TIMESTAMP(3) NOT NULL,
    "validTo" TIMESTAMP(3) NOT NULL,
    "position" INTEGER NOT NULL,

    CONSTRAINT "FeaturedModelVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoveredCheckpoint" (
    "model_id" INTEGER NOT NULL,
    "version_id" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "ModerationRule" (
    "id" SERIAL NOT NULL,
    "entityType" "EntityType" NOT NULL,
    "definition" JSONB NOT NULL,
    "action" "ModerationRuleAction" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "enabled" BOOLEAN NOT NULL DEFAULT true,
    "order" INTEGER,
    "reason" TEXT,
    "createdById" INTEGER NOT NULL,

    CONSTRAINT "ModerationRule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Changelog" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "link" TEXT,
    "cta" TEXT,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "type" "ChangelogType" NOT NULL,
    "tags" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "disabled" BOOLEAN NOT NULL DEFAULT false,
    "titleColor" TEXT,
    "sticky" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Changelog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewOrderPlayer" (
    "userId" INTEGER NOT NULL,
    "rankType" "NewOrderRankType" NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "exp" INTEGER NOT NULL DEFAULT 0,
    "fervor" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "NewOrderPlayer_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "NewOrderRank" (
    "type" "NewOrderRankType" NOT NULL,
    "name" TEXT NOT NULL,
    "minExp" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "iconUrl" TEXT,

    CONSTRAINT "NewOrderRank_pkey" PRIMARY KEY ("type")
);

-- CreateTable
CREATE TABLE "NewOrderSmite" (
    "id" SERIAL NOT NULL,
    "targetPlayerId" INTEGER NOT NULL,
    "givenById" INTEGER NOT NULL,
    "size" INTEGER NOT NULL,
    "remaining" INTEGER NOT NULL,
    "reason" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cleansedAt" TIMESTAMP(3),
    "cleansedReason" TEXT,

    CONSTRAINT "NewOrderSmite_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuestionRank" (
    "questionId" INTEGER NOT NULL,
    "answerCountDay" INTEGER NOT NULL,
    "answerCountWeek" INTEGER NOT NULL,
    "answerCountMonth" INTEGER NOT NULL,
    "answerCountYear" INTEGER NOT NULL,
    "answerCountAllTime" INTEGER NOT NULL,
    "heartCountDay" INTEGER NOT NULL,
    "heartCountWeek" INTEGER NOT NULL,
    "heartCountMonth" INTEGER NOT NULL,
    "heartCountYear" INTEGER NOT NULL,
    "heartCountAllTime" INTEGER NOT NULL,
    "commentCountDay" INTEGER NOT NULL,
    "commentCountWeek" INTEGER NOT NULL,
    "commentCountMonth" INTEGER NOT NULL,
    "commentCountYear" INTEGER NOT NULL,
    "commentCountAllTime" INTEGER NOT NULL,
    "answerCountDayRank" INTEGER NOT NULL,
    "answerCountWeekRank" INTEGER NOT NULL,
    "answerCountMonthRank" INTEGER NOT NULL,
    "answerCountYearRank" INTEGER NOT NULL,
    "answerCountAllTimeRank" INTEGER NOT NULL,
    "heartCountDayRank" INTEGER NOT NULL,
    "heartCountWeekRank" INTEGER NOT NULL,
    "heartCountMonthRank" INTEGER NOT NULL,
    "heartCountYearRank" INTEGER NOT NULL,
    "heartCountAllTimeRank" INTEGER NOT NULL,
    "commentCountDayRank" INTEGER NOT NULL,
    "commentCountWeekRank" INTEGER NOT NULL,
    "commentCountMonthRank" INTEGER NOT NULL,
    "commentCountYearRank" INTEGER NOT NULL,
    "commentCountAllTimeRank" INTEGER NOT NULL,

    CONSTRAINT "QuestionRank_pkey" PRIMARY KEY ("questionId")
);

-- CreateTable
CREATE TABLE "AnswerRank" (
    "answerId" INTEGER NOT NULL,
    "checkCountDay" INTEGER NOT NULL,
    "checkCountWeek" INTEGER NOT NULL,
    "checkCountMonth" INTEGER NOT NULL,
    "checkCountYear" INTEGER NOT NULL,
    "checkCountAllTime" INTEGER NOT NULL,
    "crossCountDay" INTEGER NOT NULL,
    "crossCountWeek" INTEGER NOT NULL,
    "crossCountMonth" INTEGER NOT NULL,
    "crossCountYear" INTEGER NOT NULL,
    "crossCountAllTime" INTEGER NOT NULL,
    "heartCountDay" INTEGER NOT NULL,
    "heartCountWeek" INTEGER NOT NULL,
    "heartCountMonth" INTEGER NOT NULL,
    "heartCountYear" INTEGER NOT NULL,
    "heartCountAllTime" INTEGER NOT NULL,
    "commentCountDay" INTEGER NOT NULL,
    "commentCountWeek" INTEGER NOT NULL,
    "commentCountMonth" INTEGER NOT NULL,
    "commentCountYear" INTEGER NOT NULL,
    "commentCountAllTime" INTEGER NOT NULL,
    "checkCountDayRank" INTEGER NOT NULL,
    "checkCountWeekRank" INTEGER NOT NULL,
    "checkCountMonthRank" INTEGER NOT NULL,
    "checkCountYearRank" INTEGER NOT NULL,
    "checkCountAllTimeRank" INTEGER NOT NULL,
    "crossCountDayRank" INTEGER NOT NULL,
    "crossCountWeekRank" INTEGER NOT NULL,
    "crossCountMonthRank" INTEGER NOT NULL,
    "crossCountYearRank" INTEGER NOT NULL,
    "crossCountAllTimeRank" INTEGER NOT NULL,
    "heartCountDayRank" INTEGER NOT NULL,
    "heartCountWeekRank" INTEGER NOT NULL,
    "heartCountMonthRank" INTEGER NOT NULL,
    "heartCountYearRank" INTEGER NOT NULL,
    "heartCountAllTimeRank" INTEGER NOT NULL,
    "commentCountDayRank" INTEGER NOT NULL,
    "commentCountWeekRank" INTEGER NOT NULL,
    "commentCountMonthRank" INTEGER NOT NULL,
    "commentCountYearRank" INTEGER NOT NULL,
    "commentCountAllTimeRank" INTEGER NOT NULL,

    CONSTRAINT "AnswerRank_pkey" PRIMARY KEY ("answerId")
);

-- CreateTable
CREATE TABLE "ModelReportStat" (
    "modelId" INTEGER NOT NULL,
    "tosViolationPending" INTEGER NOT NULL,
    "tosViolationUnactioned" INTEGER NOT NULL,
    "tosViolationActioned" INTEGER NOT NULL,
    "nsfwPending" INTEGER NOT NULL,
    "nsfwUnactioned" INTEGER NOT NULL,
    "nsfwActioned" INTEGER NOT NULL,
    "ownershipPending" INTEGER NOT NULL,
    "ownershipProcessing" INTEGER NOT NULL,
    "ownershipActioned" INTEGER NOT NULL,
    "ownershipUnactioned" INTEGER NOT NULL,
    "adminAttentionPending" INTEGER NOT NULL,
    "adminAttentionActioned" INTEGER NOT NULL,
    "adminAttentionUnactioned" INTEGER NOT NULL,
    "claimPending" INTEGER NOT NULL,
    "claimActioned" INTEGER NOT NULL,
    "claimUnactioned" INTEGER NOT NULL,

    CONSTRAINT "ModelReportStat_pkey" PRIMARY KEY ("modelId")
);

-- CreateTable
CREATE TABLE "ArticleStat" (
    "articleId" INTEGER NOT NULL,
    "cryCountDay" INTEGER NOT NULL DEFAULT 0,
    "cryCountWeek" INTEGER NOT NULL DEFAULT 0,
    "cryCountMonth" INTEGER NOT NULL DEFAULT 0,
    "cryCountYear" INTEGER NOT NULL DEFAULT 0,
    "cryCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountDay" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountWeek" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountMonth" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountYear" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "heartCountDay" INTEGER NOT NULL DEFAULT 0,
    "heartCountWeek" INTEGER NOT NULL DEFAULT 0,
    "heartCountMonth" INTEGER NOT NULL DEFAULT 0,
    "heartCountYear" INTEGER NOT NULL DEFAULT 0,
    "heartCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "laughCountDay" INTEGER NOT NULL DEFAULT 0,
    "laughCountWeek" INTEGER NOT NULL DEFAULT 0,
    "laughCountMonth" INTEGER NOT NULL DEFAULT 0,
    "laughCountYear" INTEGER NOT NULL DEFAULT 0,
    "laughCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "likeCountDay" INTEGER NOT NULL DEFAULT 0,
    "likeCountWeek" INTEGER NOT NULL DEFAULT 0,
    "likeCountMonth" INTEGER NOT NULL DEFAULT 0,
    "likeCountYear" INTEGER NOT NULL DEFAULT 0,
    "likeCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "commentCountDay" INTEGER NOT NULL DEFAULT 0,
    "commentCountWeek" INTEGER NOT NULL DEFAULT 0,
    "commentCountMonth" INTEGER NOT NULL DEFAULT 0,
    "commentCountYear" INTEGER NOT NULL DEFAULT 0,
    "commentCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "reactionCountDay" INTEGER NOT NULL DEFAULT 0,
    "reactionCountWeek" INTEGER NOT NULL DEFAULT 0,
    "reactionCountMonth" INTEGER NOT NULL DEFAULT 0,
    "reactionCountYear" INTEGER NOT NULL DEFAULT 0,
    "reactionCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "viewCountDay" INTEGER NOT NULL DEFAULT 0,
    "viewCountWeek" INTEGER NOT NULL DEFAULT 0,
    "viewCountMonth" INTEGER NOT NULL DEFAULT 0,
    "viewCountYear" INTEGER NOT NULL DEFAULT 0,
    "viewCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountDay" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountWeek" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountMonth" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountYear" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "collectedCountDay" INTEGER NOT NULL DEFAULT 0,
    "collectedCountWeek" INTEGER NOT NULL DEFAULT 0,
    "collectedCountMonth" INTEGER NOT NULL DEFAULT 0,
    "collectedCountYear" INTEGER NOT NULL DEFAULT 0,
    "collectedCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "hideCountDay" INTEGER NOT NULL DEFAULT 0,
    "hideCountWeek" INTEGER NOT NULL DEFAULT 0,
    "hideCountMonth" INTEGER NOT NULL DEFAULT 0,
    "hideCountYear" INTEGER NOT NULL DEFAULT 0,
    "hideCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "tippedCountDay" INTEGER NOT NULL DEFAULT 0,
    "tippedCountWeek" INTEGER NOT NULL DEFAULT 0,
    "tippedCountMonth" INTEGER NOT NULL DEFAULT 0,
    "tippedCountYear" INTEGER NOT NULL DEFAULT 0,
    "tippedCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountDay" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountWeek" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountMonth" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountYear" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountAllTime" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ArticleStat_pkey" PRIMARY KEY ("articleId")
);

-- CreateTable
CREATE TABLE "ArticleRank" (
    "articleId" INTEGER NOT NULL,
    "cryCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "cryCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "cryCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "cryCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "cryCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "viewCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "viewCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "viewCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "viewCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "viewCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "hideCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "hideCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "hideCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "hideCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "hideCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "collectedCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "collectedCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "collectedCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "collectedCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "collectedCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ArticleRank_pkey" PRIMARY KEY ("articleId")
);

-- CreateTable
CREATE TABLE "UserStat" (
    "userId" INTEGER NOT NULL,
    "uploadCountDay" INTEGER NOT NULL,
    "uploadCountWeek" INTEGER NOT NULL,
    "uploadCountMonth" INTEGER NOT NULL,
    "uploadCountYear" INTEGER NOT NULL,
    "uploadCountAllTime" INTEGER NOT NULL,
    "reviewCountDay" INTEGER NOT NULL,
    "reviewCountWeek" INTEGER NOT NULL,
    "reviewCountMonth" INTEGER NOT NULL,
    "reviewCountYear" INTEGER NOT NULL,
    "reviewCountAllTime" INTEGER NOT NULL,
    "downloadCountDay" INTEGER NOT NULL,
    "downloadCountWeek" INTEGER NOT NULL,
    "downloadCountMonth" INTEGER NOT NULL,
    "downloadCountYear" INTEGER NOT NULL,
    "downloadCountAllTime" INTEGER NOT NULL,
    "generationCountDay" INTEGER NOT NULL,
    "generationCountWeek" INTEGER NOT NULL,
    "generationCountMonth" INTEGER NOT NULL,
    "generationCountYear" INTEGER NOT NULL,
    "generationCountAllTime" INTEGER NOT NULL,
    "ratingCountDay" INTEGER NOT NULL,
    "ratingCountWeek" INTEGER NOT NULL,
    "ratingCountMonth" INTEGER NOT NULL,
    "ratingCountYear" INTEGER NOT NULL,
    "ratingCountAllTime" INTEGER NOT NULL,
    "followingCountDay" INTEGER NOT NULL,
    "followingCountWeek" INTEGER NOT NULL,
    "followingCountMonth" INTEGER NOT NULL,
    "followingCountYear" INTEGER NOT NULL,
    "followingCountAllTime" INTEGER NOT NULL,
    "followerCountDay" INTEGER NOT NULL,
    "followerCountWeek" INTEGER NOT NULL,
    "followerCountMonth" INTEGER NOT NULL,
    "followerCountYear" INTEGER NOT NULL,
    "followerCountAllTime" INTEGER NOT NULL,
    "hiddenCountDay" INTEGER NOT NULL,
    "hiddenCountWeek" INTEGER NOT NULL,
    "hiddenCountMonth" INTEGER NOT NULL,
    "hiddenCountYear" INTEGER NOT NULL,
    "hiddenCountAllTime" INTEGER NOT NULL,
    "ratingDay" DOUBLE PRECISION NOT NULL,
    "ratingWeek" DOUBLE PRECISION NOT NULL,
    "ratingMonth" DOUBLE PRECISION NOT NULL,
    "ratingYear" DOUBLE PRECISION NOT NULL,
    "ratingAllTime" DOUBLE PRECISION NOT NULL,
    "favoriteCountDay" INTEGER NOT NULL,
    "favoriteCountWeek" INTEGER NOT NULL,
    "favoriteCountMonth" INTEGER NOT NULL,
    "favoriteCountYear" INTEGER NOT NULL,
    "favoriteCountAllTime" INTEGER NOT NULL,
    "answerCountDay" INTEGER NOT NULL,
    "answerCountWeek" INTEGER NOT NULL,
    "answerCountMonth" INTEGER NOT NULL,
    "answerCountYear" INTEGER NOT NULL,
    "answerCountAllTime" INTEGER NOT NULL,
    "answerAcceptCountDay" INTEGER NOT NULL,
    "answerAcceptCountWeek" INTEGER NOT NULL,
    "answerAcceptCountMonth" INTEGER NOT NULL,
    "answerAcceptCountYear" INTEGER NOT NULL,
    "answerAcceptCountAllTime" INTEGER NOT NULL,
    "thumbsUpCountDay" INTEGER NOT NULL,
    "thumbsUpCountWeek" INTEGER NOT NULL,
    "thumbsUpCountMonth" INTEGER NOT NULL,
    "thumbsUpCountYear" INTEGER NOT NULL,
    "thumbsUpCountAllTime" INTEGER NOT NULL,
    "thumbsDownCountDay" INTEGER NOT NULL,
    "thumbsDownCountWeek" INTEGER NOT NULL,
    "thumbsDownCountMonth" INTEGER NOT NULL,
    "thumbsDownCountYear" INTEGER NOT NULL,
    "thumbsDownCountAllTime" INTEGER NOT NULL,
    "reactionCountDay" INTEGER NOT NULL,
    "reactionCountWeek" INTEGER NOT NULL,
    "reactionCountMonth" INTEGER NOT NULL,
    "reactionCountYear" INTEGER NOT NULL,
    "reactionCountAllTime" INTEGER NOT NULL,

    CONSTRAINT "UserStat_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "UserRank" (
    "userId" INTEGER NOT NULL,
    "downloadCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "downloadCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "downloadCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "downloadCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "downloadCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "ratingCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "ratingCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "ratingCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "ratingCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "ratingCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "ratingDayRank" INTEGER NOT NULL DEFAULT 0,
    "ratingWeekRank" INTEGER NOT NULL DEFAULT 0,
    "ratingMonthRank" INTEGER NOT NULL DEFAULT 0,
    "ratingYearRank" INTEGER NOT NULL DEFAULT 0,
    "ratingAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "answerCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "answerCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "answerCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "answerCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "answerCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "answerAcceptCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "answerAcceptCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "answerAcceptCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "answerAcceptCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "answerAcceptCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsUpCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsUpCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsUpCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsUpCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsUpCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsDownCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsDownCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsDownCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsDownCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "thumbsDownCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "leaderboardRank" INTEGER,
    "leaderboardId" TEXT,
    "leaderboardTitle" TEXT,
    "leaderboardCosmetic" TEXT,

    CONSTRAINT "UserRank_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "TagStat" (
    "tagId" INTEGER NOT NULL,
    "followerCountDay" INTEGER NOT NULL,
    "followerCountWeek" INTEGER NOT NULL,
    "followerCountMonth" INTEGER NOT NULL,
    "followerCountYear" INTEGER NOT NULL,
    "followerCountAllTime" INTEGER NOT NULL,
    "hiddenCountDay" INTEGER NOT NULL,
    "hiddenCountWeek" INTEGER NOT NULL,
    "hiddenCountMonth" INTEGER NOT NULL,
    "hiddenCountYear" INTEGER NOT NULL,
    "hiddenCountAllTime" INTEGER NOT NULL,
    "modelCountDay" INTEGER NOT NULL,
    "modelCountWeek" INTEGER NOT NULL,
    "modelCountMonth" INTEGER NOT NULL,
    "modelCountYear" INTEGER NOT NULL,
    "modelCountAllTime" INTEGER NOT NULL,
    "imageCountDay" INTEGER NOT NULL,
    "imageCountWeek" INTEGER NOT NULL,
    "imageCountMonth" INTEGER NOT NULL,
    "imageCountYear" INTEGER NOT NULL,
    "imageCountAllTime" INTEGER NOT NULL,
    "postCountDay" INTEGER NOT NULL,
    "postCountWeek" INTEGER NOT NULL,
    "postCountMonth" INTEGER NOT NULL,
    "postCountYear" INTEGER NOT NULL,
    "postCountAllTime" INTEGER NOT NULL,

    CONSTRAINT "TagStat_pkey" PRIMARY KEY ("tagId")
);

-- CreateTable
CREATE TABLE "TagRank" (
    "tagId" INTEGER NOT NULL,
    "followerCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "hiddenCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "hiddenCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "hiddenCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "hiddenCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "hiddenCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "modelCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "modelCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "modelCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "modelCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "modelCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "imageCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "imageCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "imageCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "imageCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "imageCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "postCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "postCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "postCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "postCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "postCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "articleCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "articleCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "articleCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "articleCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "articleCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "TagRank_pkey" PRIMARY KEY ("tagId")
);

-- CreateTable
CREATE TABLE "ImageStat" (
    "imageId" INTEGER NOT NULL,
    "cryCountDay" INTEGER NOT NULL DEFAULT 0,
    "cryCountWeek" INTEGER NOT NULL DEFAULT 0,
    "cryCountMonth" INTEGER NOT NULL DEFAULT 0,
    "cryCountYear" INTEGER NOT NULL DEFAULT 0,
    "cryCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountDay" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountWeek" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountMonth" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountYear" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "heartCountDay" INTEGER NOT NULL DEFAULT 0,
    "heartCountWeek" INTEGER NOT NULL DEFAULT 0,
    "heartCountMonth" INTEGER NOT NULL DEFAULT 0,
    "heartCountYear" INTEGER NOT NULL DEFAULT 0,
    "heartCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "laughCountDay" INTEGER NOT NULL DEFAULT 0,
    "laughCountWeek" INTEGER NOT NULL DEFAULT 0,
    "laughCountMonth" INTEGER NOT NULL DEFAULT 0,
    "laughCountYear" INTEGER NOT NULL DEFAULT 0,
    "laughCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "likeCountDay" INTEGER NOT NULL DEFAULT 0,
    "likeCountWeek" INTEGER NOT NULL DEFAULT 0,
    "likeCountMonth" INTEGER NOT NULL DEFAULT 0,
    "likeCountYear" INTEGER NOT NULL DEFAULT 0,
    "likeCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "commentCountDay" INTEGER NOT NULL DEFAULT 0,
    "commentCountWeek" INTEGER NOT NULL DEFAULT 0,
    "commentCountMonth" INTEGER NOT NULL DEFAULT 0,
    "commentCountYear" INTEGER NOT NULL DEFAULT 0,
    "commentCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "reactionCountDay" INTEGER NOT NULL DEFAULT 0,
    "reactionCountWeek" INTEGER NOT NULL DEFAULT 0,
    "reactionCountMonth" INTEGER NOT NULL DEFAULT 0,
    "reactionCountYear" INTEGER NOT NULL DEFAULT 0,
    "reactionCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "collectedCountDay" INTEGER NOT NULL DEFAULT 0,
    "collectedCountWeek" INTEGER NOT NULL DEFAULT 0,
    "collectedCountMonth" INTEGER NOT NULL DEFAULT 0,
    "collectedCountYear" INTEGER NOT NULL DEFAULT 0,
    "collectedCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "tippedCountDay" INTEGER NOT NULL DEFAULT 0,
    "tippedCountWeek" INTEGER NOT NULL DEFAULT 0,
    "tippedCountMonth" INTEGER NOT NULL DEFAULT 0,
    "tippedCountYear" INTEGER NOT NULL DEFAULT 0,
    "tippedCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountDay" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountWeek" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountMonth" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountYear" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "viewCountDay" INTEGER NOT NULL DEFAULT 0,
    "viewCountWeek" INTEGER NOT NULL DEFAULT 0,
    "viewCountMonth" INTEGER NOT NULL DEFAULT 0,
    "viewCountYear" INTEGER NOT NULL DEFAULT 0,
    "viewCountAllTime" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ImageStat_pkey" PRIMARY KEY ("imageId")
);

-- CreateTable
CREATE TABLE "ImageModHelper" (
    "imageId" INTEGER NOT NULL,
    "assessedNSFW" BOOLEAN DEFAULT false,
    "nsfwReportCount" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ImageModHelper_pkey" PRIMARY KEY ("imageId")
);

-- CreateTable
CREATE TABLE "ModelHash" (
    "modelId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "hashType" "ModelHashType" NOT NULL,
    "fileType" TEXT NOT NULL,
    "hash" TEXT NOT NULL,

    CONSTRAINT "ModelHash_pkey" PRIMARY KEY ("modelId")
);

-- CreateTable
CREATE TABLE "PostHelper" (
    "postId" INTEGER NOT NULL,
    "scanned" BOOLEAN NOT NULL,

    CONSTRAINT "PostHelper_pkey" PRIMARY KEY ("postId")
);

-- CreateTable
CREATE TABLE "PostStat" (
    "postId" INTEGER NOT NULL,
    "cryCountDay" INTEGER NOT NULL DEFAULT 0,
    "cryCountWeek" INTEGER NOT NULL DEFAULT 0,
    "cryCountMonth" INTEGER NOT NULL DEFAULT 0,
    "cryCountYear" INTEGER NOT NULL DEFAULT 0,
    "cryCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountDay" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountWeek" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountMonth" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountYear" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "heartCountDay" INTEGER NOT NULL DEFAULT 0,
    "heartCountWeek" INTEGER NOT NULL DEFAULT 0,
    "heartCountMonth" INTEGER NOT NULL DEFAULT 0,
    "heartCountYear" INTEGER NOT NULL DEFAULT 0,
    "heartCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "laughCountDay" INTEGER NOT NULL DEFAULT 0,
    "laughCountWeek" INTEGER NOT NULL DEFAULT 0,
    "laughCountMonth" INTEGER NOT NULL DEFAULT 0,
    "laughCountYear" INTEGER NOT NULL DEFAULT 0,
    "laughCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "likeCountDay" INTEGER NOT NULL DEFAULT 0,
    "likeCountWeek" INTEGER NOT NULL DEFAULT 0,
    "likeCountMonth" INTEGER NOT NULL DEFAULT 0,
    "likeCountYear" INTEGER NOT NULL DEFAULT 0,
    "likeCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "commentCountDay" INTEGER NOT NULL DEFAULT 0,
    "commentCountWeek" INTEGER NOT NULL DEFAULT 0,
    "commentCountMonth" INTEGER NOT NULL DEFAULT 0,
    "commentCountYear" INTEGER NOT NULL DEFAULT 0,
    "commentCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "reactionCountDay" INTEGER NOT NULL DEFAULT 0,
    "reactionCountWeek" INTEGER NOT NULL DEFAULT 0,
    "reactionCountMonth" INTEGER NOT NULL DEFAULT 0,
    "reactionCountYear" INTEGER NOT NULL DEFAULT 0,
    "reactionCountAllTime" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "PostStat_pkey" PRIMARY KEY ("postId")
);

-- CreateTable
CREATE TABLE "CollectionStat" (
    "collectionId" INTEGER NOT NULL,
    "followerCountDay" INTEGER NOT NULL,
    "followerCountWeek" INTEGER NOT NULL,
    "followerCountMonth" INTEGER NOT NULL,
    "followerCountYear" INTEGER NOT NULL,
    "followerCountAllTime" INTEGER NOT NULL,
    "itemCountDay" INTEGER NOT NULL,
    "itemCountWeek" INTEGER NOT NULL,
    "itemCountMonth" INTEGER NOT NULL,
    "itemCountYear" INTEGER NOT NULL,
    "itemCountAllTime" INTEGER NOT NULL,
    "contributorCountDay" INTEGER NOT NULL,
    "contributorCountWeek" INTEGER NOT NULL,
    "contributorCountMonth" INTEGER NOT NULL,
    "contributorCountYear" INTEGER NOT NULL,
    "contributorCountAllTime" INTEGER NOT NULL,

    CONSTRAINT "CollectionStat_pkey" PRIMARY KEY ("collectionId")
);

-- CreateTable
CREATE TABLE "CollectionRank" (
    "collectionId" INTEGER NOT NULL,
    "followerCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "followerCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "itemCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "itemCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "itemCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "itemCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "itemCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "contributorCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "contributorCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "contributorCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "contributorCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "contributorCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "CollectionRank_pkey" PRIMARY KEY ("collectionId")
);

-- CreateTable
CREATE TABLE "ImageTag" (
    "imageId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "tagName" TEXT NOT NULL,
    "tagType" "TagType" NOT NULL,
    "tagNsfw" "NsfwLevel" NOT NULL,
    "tagNsfwLevel" INTEGER NOT NULL,
    "automated" BOOLEAN NOT NULL,
    "confidence" INTEGER,
    "score" INTEGER NOT NULL,
    "upVotes" INTEGER NOT NULL,
    "downVotes" INTEGER NOT NULL,
    "needsReview" BOOLEAN NOT NULL,
    "concrete" BOOLEAN NOT NULL,
    "lastUpvote" TIMESTAMP(3),
    "source" "TagSource" NOT NULL,

    CONSTRAINT "ImageTag_pkey" PRIMARY KEY ("imageId","tagId")
);

-- CreateTable
CREATE TABLE "ModelTag" (
    "modelId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "tagName" TEXT NOT NULL,
    "tagType" "TagType" NOT NULL,
    "score" INTEGER NOT NULL,
    "upVotes" INTEGER NOT NULL,
    "downVotes" INTEGER NOT NULL,
    "needsReview" BOOLEAN NOT NULL,

    CONSTRAINT "ModelTag_pkey" PRIMARY KEY ("modelId","tagId")
);

-- CreateTable
CREATE TABLE "ImageResourceHelper" (
    "imageId" INTEGER NOT NULL,
    "reviewId" INTEGER,
    "reviewRating" INTEGER,
    "reviewDetails" TEXT,
    "reviewCreatedAt" TIMESTAMP(3),
    "name" TEXT,
    "modelVersionId" INTEGER NOT NULL,
    "modelVersionName" TEXT,
    "modelVersionCreatedAt" TIMESTAMP(3),
    "modelId" INTEGER,
    "modelName" TEXT,
    "modelDownloadCount" INTEGER,
    "modelCommentCount" INTEGER,
    "modelThumbsUpCount" INTEGER,
    "modelThumbsDownCount" INTEGER,
    "modelType" "ModelType",
    "modelVersionBaseModel" TEXT,
    "detected" BOOLEAN,

    CONSTRAINT "ImageResourceHelper_pkey" PRIMARY KEY ("imageId","modelVersionId")
);

-- CreateTable
CREATE TABLE "PostResourceHelper" (
    "postId" INTEGER NOT NULL,
    "reviewId" INTEGER,
    "reviewRating" INTEGER,
    "reviewRecommended" BOOLEAN,
    "reviewDetails" TEXT,
    "reviewCreatedAt" TIMESTAMP(3),
    "name" TEXT,
    "imageId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "modelVersionName" TEXT,
    "modelVersionCreatedAt" TIMESTAMP(3),
    "modelId" INTEGER,
    "modelName" TEXT,
    "modelDownloadCount" INTEGER,
    "modelCommentCount" INTEGER,
    "modelThumbsUpCount" INTEGER,
    "modelThumbsDownCount" INTEGER,
    "modelType" "ModelType",

    CONSTRAINT "PostResourceHelper_pkey" PRIMARY KEY ("imageId","modelVersionId")
);

-- CreateTable
CREATE TABLE "PostImageTag" (
    "postId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,

    CONSTRAINT "PostImageTag_pkey" PRIMARY KEY ("postId","tagId")
);

-- CreateTable
CREATE TABLE "PostTag" (
    "postId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "tagName" TEXT NOT NULL,
    "tagType" "TagType" NOT NULL,
    "score" INTEGER NOT NULL,
    "upVotes" INTEGER NOT NULL,
    "downVotes" INTEGER NOT NULL,

    CONSTRAINT "PostTag_pkey" PRIMARY KEY ("postId","tagId")
);

-- CreateTable
CREATE TABLE "ResourceReviewHelper" (
    "resourceReviewId" INTEGER NOT NULL,
    "imageCount" INTEGER NOT NULL,

    CONSTRAINT "ResourceReviewHelper_pkey" PRIMARY KEY ("resourceReviewId")
);

-- CreateTable
CREATE TABLE "GenerationCoverage" (
    "modelId" INTEGER NOT NULL,
    "modelVersionId" INTEGER NOT NULL,
    "covered" BOOLEAN NOT NULL,

    CONSTRAINT "GenerationCoverage_pkey" PRIMARY KEY ("modelId","modelVersionId")
);

-- CreateTable
CREATE TABLE "UserProfile" (
    "userId" INTEGER NOT NULL,
    "coverImageId" INTEGER,
    "bio" TEXT,
    "message" TEXT,
    "messageAddedAt" TIMESTAMP(3),
    "location" TEXT,
    "nsfw" BOOLEAN NOT NULL DEFAULT false,
    "privacySettings" JSONB NOT NULL DEFAULT '{"showFollowerCount":true,"showFollowingCount":true,"showReviewsRating":true}',
    "profileSectionsSettings" JSONB NOT NULL DEFAULT '[{"key":"showcase","enabled":true},{"key":"popularModels","enabled":true},{"key":"popularArticles","enabled":true},{"key":"modelsOverview","enabled":true},{"key":"imagesOverview","enabled":true},{"key":"recentReviews","enabled":true}]',
    "showcaseItems" JSONB NOT NULL DEFAULT '[]',

    CONSTRAINT "UserProfile_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "BountyStat" (
    "bountyId" INTEGER NOT NULL,
    "favoriteCountDay" INTEGER NOT NULL,
    "favoriteCountWeek" INTEGER NOT NULL,
    "favoriteCountMonth" INTEGER NOT NULL,
    "favoriteCountYear" INTEGER NOT NULL,
    "favoriteCountAllTime" INTEGER NOT NULL,
    "trackCountDay" INTEGER NOT NULL,
    "trackCountWeek" INTEGER NOT NULL,
    "trackCountMonth" INTEGER NOT NULL,
    "trackCountYear" INTEGER NOT NULL,
    "trackCountAllTime" INTEGER NOT NULL,
    "entryCountDay" INTEGER NOT NULL,
    "entryCountWeek" INTEGER NOT NULL,
    "entryCountMonth" INTEGER NOT NULL,
    "entryCountYear" INTEGER NOT NULL,
    "entryCountAllTime" INTEGER NOT NULL,
    "benefactorCountDay" INTEGER NOT NULL,
    "benefactorCountWeek" INTEGER NOT NULL,
    "benefactorCountMonth" INTEGER NOT NULL,
    "benefactorCountYear" INTEGER NOT NULL,
    "benefactorCountAllTime" INTEGER NOT NULL,
    "unitAmountCountDay" INTEGER NOT NULL,
    "unitAmountCountWeek" INTEGER NOT NULL,
    "unitAmountCountMonth" INTEGER NOT NULL,
    "unitAmountCountYear" INTEGER NOT NULL,
    "unitAmountCountAllTime" INTEGER NOT NULL,
    "commentCountDay" INTEGER NOT NULL,
    "commentCountWeek" INTEGER NOT NULL,
    "commentCountMonth" INTEGER NOT NULL,
    "commentCountYear" INTEGER NOT NULL,
    "commentCountAllTime" INTEGER NOT NULL,

    CONSTRAINT "BountyStat_pkey" PRIMARY KEY ("bountyId")
);

-- CreateTable
CREATE TABLE "BountyRank" (
    "bountyId" INTEGER NOT NULL,
    "favoriteCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "favoriteCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "trackCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "trackCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "trackCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "trackCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "trackCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "entryCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "entryCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "entryCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "entryCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "entryCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "benefactorCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "benefactorCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "benefactorCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "benefactorCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "benefactorCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "commentCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "BountyRank_pkey" PRIMARY KEY ("bountyId")
);

-- CreateTable
CREATE TABLE "BountyEntryStat" (
    "bountyEntryId" INTEGER NOT NULL,
    "cryCountDay" INTEGER NOT NULL,
    "cryCountWeek" INTEGER NOT NULL,
    "cryCountMonth" INTEGER NOT NULL,
    "cryCountYear" INTEGER NOT NULL,
    "cryCountAllTime" INTEGER NOT NULL,
    "dislikeCountDay" INTEGER NOT NULL,
    "dislikeCountWeek" INTEGER NOT NULL,
    "dislikeCountMonth" INTEGER NOT NULL,
    "dislikeCountYear" INTEGER NOT NULL,
    "dislikeCountAllTime" INTEGER NOT NULL,
    "heartCountDay" INTEGER NOT NULL,
    "heartCountWeek" INTEGER NOT NULL,
    "heartCountMonth" INTEGER NOT NULL,
    "heartCountYear" INTEGER NOT NULL,
    "heartCountAllTime" INTEGER NOT NULL,
    "laughCountDay" INTEGER NOT NULL,
    "laughCountWeek" INTEGER NOT NULL,
    "laughCountMonth" INTEGER NOT NULL,
    "laughCountYear" INTEGER NOT NULL,
    "laughCountAllTime" INTEGER NOT NULL,
    "likeCountDay" INTEGER NOT NULL,
    "likeCountWeek" INTEGER NOT NULL,
    "likeCountMonth" INTEGER NOT NULL,
    "likeCountYear" INTEGER NOT NULL,
    "likeCountAllTime" INTEGER NOT NULL,
    "reactionCountDay" INTEGER NOT NULL,
    "reactionCountWeek" INTEGER NOT NULL,
    "reactionCountMonth" INTEGER NOT NULL,
    "reactionCountYear" INTEGER NOT NULL,
    "reactionCountAllTime" INTEGER NOT NULL,
    "unitAmountCountDay" INTEGER NOT NULL,
    "unitAmountCountWeek" INTEGER NOT NULL,
    "unitAmountCountMonth" INTEGER NOT NULL,
    "unitAmountCountYear" INTEGER NOT NULL,
    "unitAmountCountAllTime" INTEGER NOT NULL,
    "tippedCountDay" INTEGER NOT NULL DEFAULT 0,
    "tippedCountWeek" INTEGER NOT NULL DEFAULT 0,
    "tippedCountMonth" INTEGER NOT NULL DEFAULT 0,
    "tippedCountYear" INTEGER NOT NULL DEFAULT 0,
    "tippedCountAllTime" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountDay" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountWeek" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountMonth" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountYear" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountAllTime" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "BountyEntryStat_pkey" PRIMARY KEY ("bountyEntryId")
);

-- CreateTable
CREATE TABLE "BountyEntryRank" (
    "bountyEntryId" INTEGER NOT NULL,
    "cryCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "cryCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "cryCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "cryCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "cryCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "dislikeCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "heartCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "laughCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "likeCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "reactionCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "unitAmountCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "tippedCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "tippedAmountCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "BountyEntryRank_pkey" PRIMARY KEY ("bountyEntryId")
);

-- CreateTable
CREATE TABLE "ClubStat" (
    "clubId" INTEGER NOT NULL,
    "memberCountDay" INTEGER NOT NULL,
    "memberCountWeek" INTEGER NOT NULL,
    "memberCountMonth" INTEGER NOT NULL,
    "memberCountYear" INTEGER NOT NULL,
    "memberCountAllTime" INTEGER NOT NULL,
    "resourceCountDay" INTEGER NOT NULL,
    "resourceCountWeek" INTEGER NOT NULL,
    "resourceCountMonth" INTEGER NOT NULL,
    "resourceCountYear" INTEGER NOT NULL,
    "resourceCountAllTime" INTEGER NOT NULL,
    "clubPostCountDay" INTEGER NOT NULL,
    "clubPostCountWeek" INTEGER NOT NULL,
    "clubPostCountMonth" INTEGER NOT NULL,
    "clubPostCountYear" INTEGER NOT NULL,
    "clubPostCountAllTime" INTEGER NOT NULL,

    CONSTRAINT "ClubStat_pkey" PRIMARY KEY ("clubId")
);

-- CreateTable
CREATE TABLE "ClubRank" (
    "clubId" INTEGER NOT NULL,
    "memberCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "memberCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "memberCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "memberCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "memberCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "resourceCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "resourceCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "resourceCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "resourceCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "resourceCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,
    "clubPostCountDayRank" INTEGER NOT NULL DEFAULT 0,
    "clubPostCountWeekRank" INTEGER NOT NULL DEFAULT 0,
    "clubPostCountMonthRank" INTEGER NOT NULL DEFAULT 0,
    "clubPostCountYearRank" INTEGER NOT NULL DEFAULT 0,
    "clubPostCountAllTimeRank" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "ClubRank_pkey" PRIMARY KEY ("clubId")
);

-- CreateTable
CREATE TABLE "EntityMetric" (
    "entityType" "EntityMetric_EntityType_Type" NOT NULL,
    "entityId" INTEGER NOT NULL,
    "metricType" "EntityMetric_MetricType_Type" NOT NULL,
    "metricValue" INTEGER NOT NULL DEFAULT 0,

    CONSTRAINT "EntityMetric_pkey" PRIMARY KEY ("entityType","entityId","metricType")
);

-- CreateTable
CREATE TABLE "EntityMetricImage" (
    "imageId" INTEGER NOT NULL,
    "reactionLike" INTEGER,
    "reactionHeart" INTEGER,
    "reactionLaugh" INTEGER,
    "reactionCry" INTEGER,
    "reactionTotal" INTEGER,
    "comment" INTEGER,
    "collection" INTEGER,
    "buzz" INTEGER,

    CONSTRAINT "EntityMetricImage_pkey" PRIMARY KEY ("imageId")
);

-- CreateTable
CREATE TABLE "TagsOnImageDetails" (
    "imageId" INTEGER NOT NULL,
    "tagId" INTEGER NOT NULL,
    "source" "TagSource" NOT NULL,
    "automated" BOOLEAN NOT NULL,
    "disabled" BOOLEAN NOT NULL,
    "needsReview" BOOLEAN NOT NULL,
    "reserved_1" BOOLEAN NOT NULL,
    "reserved_2" BOOLEAN NOT NULL,
    "confidence" INTEGER NOT NULL,

    CONSTRAINT "TagsOnImageDetails_pkey" PRIMARY KEY ("imageId","tagId")
);

-- CreateTable
CREATE TABLE "_LicenseToModel" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_LicenseToModel_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "Account_provider_userId_idx" ON "Account"("provider", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "Account_provider_providerAccountId_key" ON "Account"("provider", "providerAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "Session_sessionToken_key" ON "Session"("sessionToken");

-- CreateIndex
CREATE UNIQUE INDEX "UserReferral_userId_key" ON "UserReferral"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "UserReferralCode_code_key" ON "UserReferralCode"("code");

-- CreateIndex
CREATE INDEX "UserReferralCode_userId_idx" ON "UserReferralCode" USING HASH ("userId");

-- CreateIndex
CREATE UNIQUE INDEX "UserPaymentConfiguration_userId_key" ON "UserPaymentConfiguration"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "UserPaymentConfiguration_tipaltiAccountId_key" ON "UserPaymentConfiguration"("tipaltiAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "UserPaymentConfiguration_stripeAccountId_key" ON "UserPaymentConfiguration"("stripeAccountId");

-- CreateIndex
CREATE UNIQUE INDEX "CashWithdrawal_transactionId_key" ON "CashWithdrawal"("transactionId");

-- CreateIndex
CREATE INDEX "CashWithdrawal_userId_idx" ON "CashWithdrawal"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "User_customerId_key" ON "User"("customerId");

-- CreateIndex
CREATE UNIQUE INDEX "User_paddleCustomerId_key" ON "User"("paddleCustomerId");

-- CreateIndex
CREATE UNIQUE INDEX "User_profilePictureId_key" ON "User"("profilePictureId");

-- CreateIndex
CREATE INDEX "User_deletedAt_idx" ON "User"("deletedAt");

-- CreateIndex
CREATE UNIQUE INDEX "CustomerSubscription_userId_key" ON "CustomerSubscription"("userId");

-- CreateIndex
CREATE INDEX "UserEngagement_type_userId_idx" ON "UserEngagement"("type", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_token_key" ON "VerificationToken"("token");

-- CreateIndex
CREATE UNIQUE INDEX "VerificationToken_identifier_token_key" ON "VerificationToken"("identifier", "token");

-- CreateIndex
CREATE UNIQUE INDEX "Model_fromImportId_key" ON "Model"("fromImportId");

-- CreateIndex
CREATE INDEX "Model_name_idx" ON "Model"("name");

-- CreateIndex
CREATE INDEX "Model_status_nsfw_idx" ON "Model"("status", "nsfw");

-- CreateIndex
CREATE INDEX "ModelFlag_status_idx" ON "ModelFlag"("status");

-- CreateIndex
CREATE INDEX "ModelEngagement_modelId_idx" ON "ModelEngagement" USING HASH ("modelId");

-- CreateIndex
CREATE UNIQUE INDEX "ModelVersionSponsorshipSettings_modelVersionMonetizationId_key" ON "ModelVersionSponsorshipSettings"("modelVersionMonetizationId");

-- CreateIndex
CREATE UNIQUE INDEX "ModelVersionMonetization_modelVersionId_key" ON "ModelVersionMonetization"("modelVersionId");

-- CreateIndex
CREATE INDEX "ModelVersion_modelId_idx" ON "ModelVersion" USING HASH ("modelId");

-- CreateIndex
CREATE INDEX "RecommendedResource_sourceId_idx" ON "RecommendedResource" USING HASH ("sourceId");

-- CreateIndex
CREATE INDEX "ModelFileHash_hash_idx" ON "ModelFileHash" USING HASH ("hash");

-- CreateIndex
CREATE INDEX "ModelFile_modelVersionId_idx" ON "ModelFile" USING HASH ("modelVersionId");

-- CreateIndex
CREATE INDEX "File_entityType_entityId_idx" ON "File"("entityType", "entityId");

-- CreateIndex
CREATE INDEX "ModelMetricDaily_modelVersionId_idx" ON "ModelMetricDaily"("modelVersionId");

-- CreateIndex
CREATE INDEX "ModelAssociations_toModelId_idx" ON "ModelAssociations" USING HASH ("toModelId");

-- CreateIndex
CREATE INDEX "ModelAssociations_fromModelId_idx" ON "ModelAssociations" USING HASH ("fromModelId");

-- CreateIndex
CREATE INDEX "ModelAssociations_toArticleId_idx" ON "ModelAssociations" USING HASH ("toArticleId");

-- CreateIndex
CREATE INDEX "DownloadHistory_userId_downloadAt_idx" ON "DownloadHistory"("userId", "downloadAt");

-- CreateIndex
CREATE INDEX "ModActivity_createdAt_idx" ON "ModActivity"("createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "ModActivity_activity_entityType_entityId_key" ON "ModActivity"("activity", "entityType", "entityId");

-- CreateIndex
CREATE UNIQUE INDEX "ResourceReviewReport_reportId_key" ON "ResourceReviewReport"("reportId");

-- CreateIndex
CREATE INDEX "ResourceReviewReport_resourceReviewId_idx" ON "ResourceReviewReport" USING HASH ("resourceReviewId");

-- CreateIndex
CREATE UNIQUE INDEX "ModelReport_reportId_key" ON "ModelReport"("reportId");

-- CreateIndex
CREATE INDEX "ModelReport_modelId_idx" ON "ModelReport" USING HASH ("modelId");

-- CreateIndex
CREATE UNIQUE INDEX "CommentReport_reportId_key" ON "CommentReport"("reportId");

-- CreateIndex
CREATE INDEX "CommentReport_commentId_idx" ON "CommentReport" USING HASH ("commentId");

-- CreateIndex
CREATE UNIQUE INDEX "CommentV2Report_reportId_key" ON "CommentV2Report"("reportId");

-- CreateIndex
CREATE INDEX "CommentV2Report_commentV2Id_idx" ON "CommentV2Report" USING HASH ("commentV2Id");

-- CreateIndex
CREATE UNIQUE INDEX "ImageReport_reportId_key" ON "ImageReport"("reportId");

-- CreateIndex
CREATE INDEX "ImageReport_imageId_idx" ON "ImageReport" USING HASH ("imageId");

-- CreateIndex
CREATE UNIQUE INDEX "ArticleReport_reportId_key" ON "ArticleReport"("reportId");

-- CreateIndex
CREATE INDEX "ArticleReport_articleId_idx" ON "ArticleReport" USING HASH ("articleId");

-- CreateIndex
CREATE UNIQUE INDEX "PostReport_reportId_key" ON "PostReport"("reportId");

-- CreateIndex
CREATE INDEX "PostReport_postId_idx" ON "PostReport" USING HASH ("postId");

-- CreateIndex
CREATE UNIQUE INDEX "UserReport_reportId_key" ON "UserReport"("reportId");

-- CreateIndex
CREATE INDEX "UserReport_userId_idx" ON "UserReport" USING HASH ("userId");

-- CreateIndex
CREATE UNIQUE INDEX "CollectionReport_reportId_key" ON "CollectionReport"("reportId");

-- CreateIndex
CREATE INDEX "CollectionReport_collectionId_idx" ON "CollectionReport" USING HASH ("collectionId");

-- CreateIndex
CREATE UNIQUE INDEX "BountyReport_reportId_key" ON "BountyReport"("reportId");

-- CreateIndex
CREATE INDEX "BountyReport_bountyId_idx" ON "BountyReport" USING HASH ("bountyId");

-- CreateIndex
CREATE UNIQUE INDEX "BountyEntryReport_reportId_key" ON "BountyEntryReport"("reportId");

-- CreateIndex
CREATE INDEX "BountyEntryReport_bountyEntryId_idx" ON "BountyEntryReport" USING HASH ("bountyEntryId");

-- CreateIndex
CREATE UNIQUE INDEX "ChatReport_reportId_key" ON "ChatReport"("reportId");

-- CreateIndex
CREATE INDEX "ChatReport_chatId_idx" ON "ChatReport" USING HASH ("chatId");

-- CreateIndex
CREATE INDEX "ResourceReview_modelVersionId_idx" ON "ResourceReview" USING HASH ("modelVersionId");

-- CreateIndex
CREATE INDEX "ResourceReview_userId_idx" ON "ResourceReview" USING HASH ("userId");

-- CreateIndex
CREATE UNIQUE INDEX "ResourceReview_modelVersionId_userId_key" ON "ResourceReview"("modelVersionId", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "ResourceReviewReaction_reviewId_userId_reaction_key" ON "ResourceReviewReaction"("reviewId", "userId", "reaction");

-- CreateIndex
CREATE INDEX "Post_modelVersionId_idx" ON "Post"("modelVersionId");

-- CreateIndex
CREATE INDEX "Post_publishedAt_idx" ON "Post"("publishedAt");

-- CreateIndex
CREATE INDEX "PostMetric_postId_ageGroup_idx" ON "PostMetric"("postId", "ageGroup");

-- CreateIndex
CREATE INDEX "Image_featuredAt_idx" ON "Image"("featuredAt");

-- CreateIndex
CREATE INDEX "Image_postId_idx" ON "Image" USING HASH ("postId");

-- CreateIndex
CREATE INDEX "Image_userId_postId_idx" ON "Image"("userId", "postId");

-- CreateIndex
CREATE INDEX "Image_sortAt_idx" ON "Image"("sortAt");

-- CreateIndex
CREATE INDEX "ImageConnection_entityType_entityId_idx" ON "ImageConnection"("entityType", "entityId");

-- CreateIndex
CREATE INDEX "ImageEngagement_imageId_idx" ON "ImageEngagement"("imageId");

-- CreateIndex
CREATE INDEX "ImageResource_imageId_idx" ON "ImageResource" USING HASH ("imageId");

-- CreateIndex
CREATE INDEX "ImageResource_imageId_modelVersionId_idx" ON "ImageResource"("imageId", "modelVersionId");

-- CreateIndex
CREATE UNIQUE INDEX "ImageResource_modelVersionId_name_imageId_key" ON "ImageResource"("modelVersionId", "name", "imageId");

-- CreateIndex
CREATE INDEX "ImageResourceNew_modelVersionId_idx" ON "ImageResourceNew"("modelVersionId");

-- CreateIndex
CREATE UNIQUE INDEX "Tag_name_key" ON "Tag"("name");

-- CreateIndex
CREATE INDEX "TagsOnTags_toTagId_idx" ON "TagsOnTags" USING HASH ("toTagId");

-- CreateIndex
CREATE INDEX "TagsOnModels_modelId_idx" ON "TagsOnModels" USING HASH ("modelId");

-- CreateIndex
CREATE INDEX "TagsOnModelsVote_modelId_idx" ON "TagsOnModelsVote" USING HASH ("modelId");

-- CreateIndex
CREATE INDEX "TagsOnModelsVote_userId_idx" ON "TagsOnModelsVote" USING HASH ("userId");

-- CreateIndex
CREATE INDEX "TagsOnQuestions_questionId_idx" ON "TagsOnQuestions" USING HASH ("questionId");

-- CreateIndex
CREATE INDEX "TagsOnImageNew_tagId_idx" ON "TagsOnImageNew"("tagId");

-- CreateIndex
CREATE INDEX "ShadowTagsOnImage_tagId_idx" ON "ShadowTagsOnImage"("tagId");

-- CreateIndex
CREATE INDEX "TagsOnImageVote_imageId_idx" ON "TagsOnImageVote" USING HASH ("imageId");

-- CreateIndex
CREATE INDEX "TagsOnImageVote_userId_idx" ON "TagsOnImageVote" USING HASH ("userId");

-- CreateIndex
CREATE INDEX "TagsOnPost_postId_idx" ON "TagsOnPost" USING HASH ("postId");

-- CreateIndex
CREATE INDEX "TagsOnArticle_articleId_idx" ON "TagsOnArticle" USING HASH ("articleId");

-- CreateIndex
CREATE INDEX "TagsOnBounty_bountyId_idx" ON "TagsOnBounty" USING HASH ("bountyId");

-- CreateIndex
CREATE INDEX "TagsOnPostVote_postId_idx" ON "TagsOnPostVote" USING HASH ("postId");

-- CreateIndex
CREATE INDEX "TagsOnPostVote_userId_idx" ON "TagsOnPostVote" USING HASH ("userId");

-- CreateIndex
CREATE UNIQUE INDEX "Partner_token_key" ON "Partner"("token");

-- CreateIndex
CREATE UNIQUE INDEX "ApiKey_key_key" ON "ApiKey"("key");

-- CreateIndex
CREATE UNIQUE INDEX "AdToken_token_key" ON "AdToken"("token");

-- CreateIndex
CREATE INDEX "Comment_modelId_idx" ON "Comment" USING HASH ("modelId");

-- CreateIndex
CREATE INDEX "Comment_parentId_idx" ON "Comment" USING HASH ("parentId");

-- CreateIndex
CREATE UNIQUE INDEX "CommentReaction_commentId_userId_reaction_key" ON "CommentReaction"("commentId", "userId", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "UserNotificationSettings_userId_type_key" ON "UserNotificationSettings"("userId", "type");

-- CreateIndex
CREATE UNIQUE INDEX "Webhook_url_userId_key" ON "Webhook"("url", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "Question_selectedAnswerId_key" ON "Question"("selectedAnswerId");

-- CreateIndex
CREATE INDEX "CommentV2_threadId_idx" ON "CommentV2" USING HASH ("threadId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_questionId_key" ON "Thread"("questionId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_answerId_key" ON "Thread"("answerId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_imageId_key" ON "Thread"("imageId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_postId_key" ON "Thread"("postId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_reviewId_key" ON "Thread"("reviewId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_commentId_key" ON "Thread"("commentId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_modelId_key" ON "Thread"("modelId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_articleId_key" ON "Thread"("articleId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_bountyId_key" ON "Thread"("bountyId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_bountyEntryId_key" ON "Thread"("bountyEntryId");

-- CreateIndex
CREATE UNIQUE INDEX "Thread_clubPostId_key" ON "Thread"("clubPostId");

-- CreateIndex
CREATE INDEX "Thread_reviewId_idx" ON "Thread" USING HASH ("reviewId");

-- CreateIndex
CREATE INDEX "Thread_postId_idx" ON "Thread" USING HASH ("postId");

-- CreateIndex
CREATE INDEX "Thread_questionId_idx" ON "Thread" USING HASH ("questionId");

-- CreateIndex
CREATE INDEX "Thread_imageId_idx" ON "Thread" USING HASH ("imageId");

-- CreateIndex
CREATE INDEX "Thread_articleId_idx" ON "Thread" USING HASH ("articleId");

-- CreateIndex
CREATE INDEX "Thread_rootThreadId_idx" ON "Thread" USING HASH ("rootThreadId");

-- CreateIndex
CREATE UNIQUE INDEX "QuestionReaction_questionId_userId_reaction_key" ON "QuestionReaction"("questionId", "userId", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "AnswerReaction_answerId_userId_reaction_key" ON "AnswerReaction"("answerId", "userId", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "CommentV2Reaction_commentId_userId_reaction_key" ON "CommentV2Reaction"("commentId", "userId", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "ImageReaction_imageId_userId_reaction_key" ON "ImageReaction"("imageId", "userId", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "PostReaction_postId_userId_reaction_key" ON "PostReaction"("postId", "userId", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "ArticleReaction_articleId_userId_reaction_key" ON "ArticleReaction"("articleId", "userId", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "Article_coverId_key" ON "Article"("coverId");

-- CreateIndex
CREATE INDEX "ArticleEngagement_articleId_idx" ON "ArticleEngagement" USING HASH ("articleId");

-- CreateIndex
CREATE INDEX "LeaderboardResult_userId_idx" ON "LeaderboardResult" USING HASH ("userId");

-- CreateIndex
CREATE UNIQUE INDEX "LeaderboardResult_leaderboardId_date_userId_key" ON "LeaderboardResult"("leaderboardId", "date", "userId");

-- CreateIndex
CREATE INDEX "Collection_userId_idx" ON "Collection"("userId");

-- CreateIndex
CREATE INDEX "Collection_type_idx" ON "Collection" USING HASH ("type");

-- CreateIndex
CREATE INDEX "Collection_mode_idx" ON "Collection" USING HASH ("mode");

-- CreateIndex
CREATE INDEX "CollectionItem_addedById_idx" ON "CollectionItem" USING HASH ("addedById");

-- CreateIndex
CREATE INDEX "CollectionItem_imageId_idx" ON "CollectionItem" USING HASH ("imageId");

-- CreateIndex
CREATE INDEX "CollectionItem_modelId_idx" ON "CollectionItem" USING HASH ("modelId");

-- CreateIndex
CREATE INDEX "CollectionItem_collectionId_idx" ON "CollectionItem" USING HASH ("collectionId");

-- CreateIndex
CREATE UNIQUE INDEX "CollectionItem_collectionId_articleId_postId_imageId_modelI_key" ON "CollectionItem"("collectionId", "articleId", "postId", "imageId", "modelId");

-- CreateIndex
CREATE INDEX "CollectionContributor_userId_idx" ON "CollectionContributor" USING HASH ("userId");

-- CreateIndex
CREATE INDEX "TagsOnCollection_collectionId_idx" ON "TagsOnCollection" USING HASH ("collectionId");

-- CreateIndex
CREATE INDEX "BuzzTip_toUserId_idx" ON "BuzzTip"("toUserId");

-- CreateIndex
CREATE INDEX "Bounty_userId_idx" ON "Bounty" USING HASH ("userId");

-- CreateIndex
CREATE INDEX "Bounty_type_idx" ON "Bounty"("type");

-- CreateIndex
CREATE INDEX "Bounty_mode_idx" ON "Bounty"("mode");

-- CreateIndex
CREATE INDEX "BountyEntry_bountyId_idx" ON "BountyEntry" USING HASH ("bountyId");

-- CreateIndex
CREATE INDEX "BountyEntryReaction_bountyEntryId_idx" ON "BountyEntryReaction" USING HASH ("bountyEntryId");

-- CreateIndex
CREATE INDEX "BountyBenefactor_bountyId_idx" ON "BountyBenefactor" USING HASH ("bountyId");

-- CreateIndex
CREATE INDEX "BountyBenefactor_userId_idx" ON "BountyBenefactor" USING HASH ("userId");

-- CreateIndex
CREATE INDEX "BountyEngagement_bountyId_idx" ON "BountyEngagement"("bountyId");

-- CreateIndex
CREATE INDEX "BountyEngagement_userId_idx" ON "BountyEngagement" USING HASH ("userId");

-- CreateIndex
CREATE INDEX "EntityCollaborator_userId_entityType_entityId_idx" ON "EntityCollaborator"("userId", "entityType", "entityId");

-- CreateIndex
CREATE INDEX "Club_userId_idx" ON "Club"("userId");

-- CreateIndex
CREATE INDEX "ClubMembership_userId_idx" ON "ClubMembership"("userId");

-- CreateIndex
CREATE INDEX "ClubMembership_clubId_idx" ON "ClubMembership"("clubId");

-- CreateIndex
CREATE UNIQUE INDEX "ClubMembership_userId_clubId_key" ON "ClubMembership"("userId", "clubId");

-- CreateIndex
CREATE UNIQUE INDEX "ClubPostReaction_clubPostId_userId_reaction_key" ON "ClubPostReaction"("clubPostId", "userId", "reaction");

-- CreateIndex
CREATE UNIQUE INDEX "Chat_hash_key" ON "Chat"("hash");

-- CreateIndex
CREATE INDEX "ChatMember_userId_status_isMuted_idx" ON "ChatMember"("userId", "status", "isMuted");

-- CreateIndex
CREATE INDEX "VaultItem_vaultId_idx" ON "VaultItem" USING HASH ("vaultId");

-- CreateIndex
CREATE INDEX "VaultItem_modelVersionId_idx" ON "VaultItem" USING HASH ("modelVersionId");

-- CreateIndex
CREATE INDEX "ImageTool_toolId_idx" ON "ImageTool"("toolId");

-- CreateIndex
CREATE INDEX "ImageTechnique_techniqueId_idx" ON "ImageTechnique"("techniqueId");

-- CreateIndex
CREATE INDEX "Appeal_userId_idx" ON "Appeal"("userId");

-- CreateIndex
CREATE INDEX "Appeal_status_idx" ON "Appeal"("status");

-- CreateIndex
CREATE UNIQUE INDEX "Appeal_entityType_entityId_userId_key" ON "Appeal"("entityType", "entityId", "userId");

-- CreateIndex
CREATE UNIQUE INDEX "AuctionBase_type_ecosystem_key" ON "AuctionBase"("type", "ecosystem");

-- CreateIndex
CREATE UNIQUE INDEX "AuctionBase_name_key" ON "AuctionBase"("name");

-- CreateIndex
CREATE UNIQUE INDEX "AuctionBase_slug_key" ON "AuctionBase"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Auction_auctionBaseId_startAt_key" ON "Auction"("auctionBaseId", "startAt");

-- CreateIndex
CREATE UNIQUE INDEX "Bid_auctionId_userId_entityId_key" ON "Bid"("auctionId", "userId", "entityId");

-- CreateIndex
CREATE UNIQUE INDEX "BidRecurring_auctionBaseId_userId_entityId_key" ON "BidRecurring"("auctionBaseId", "userId", "entityId");

-- CreateIndex
CREATE UNIQUE INDEX "CoveredCheckpoint_model_id_version_id_key" ON "CoveredCheckpoint"("model_id", "version_id");

-- CreateIndex
CREATE UNIQUE INDEX "NewOrderPlayer_userId_key" ON "NewOrderPlayer"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "PostResourceHelper_postId_name_modelVersionId_key" ON "PostResourceHelper"("postId", "name", "modelVersionId");

-- CreateIndex
CREATE UNIQUE INDEX "GenerationCoverage_modelVersionId_key" ON "GenerationCoverage"("modelVersionId");

-- CreateIndex
CREATE INDEX "_LicenseToModel_B_index" ON "_LicenseToModel"("B");

-- AddForeignKey
ALTER TABLE "Account" ADD CONSTRAINT "Account_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Session" ADD CONSTRAINT "Session_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SessionInvalidation" ADD CONSTRAINT "SessionInvalidation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserReferral" ADD CONSTRAINT "UserReferral_userReferralCodeId_fkey" FOREIGN KEY ("userReferralCodeId") REFERENCES "UserReferralCode"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserReferral" ADD CONSTRAINT "UserReferral_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserReferralCode" ADD CONSTRAINT "UserReferralCode_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserPaymentConfiguration" ADD CONSTRAINT "UserPaymentConfiguration_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BuzzWithdrawalRequestHistory" ADD CONSTRAINT "BuzzWithdrawalRequestHistory_requestId_fkey" FOREIGN KEY ("requestId") REFERENCES "BuzzWithdrawalRequest"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BuzzWithdrawalRequestHistory" ADD CONSTRAINT "BuzzWithdrawalRequestHistory_updatedById_fkey" FOREIGN KEY ("updatedById") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BuzzWithdrawalRequest" ADD CONSTRAINT "BuzzWithdrawalRequest_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CashWithdrawal" ADD CONSTRAINT "CashWithdrawal_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_profilePictureId_fkey" FOREIGN KEY ("profilePictureId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerSubscription" ADD CONSTRAINT "CustomerSubscription_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerSubscription" ADD CONSTRAINT "CustomerSubscription_priceId_fkey" FOREIGN KEY ("priceId") REFERENCES "Price"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CustomerSubscription" ADD CONSTRAINT "CustomerSubscription_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Price" ADD CONSTRAINT "Price_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_productId_fkey" FOREIGN KEY ("productId") REFERENCES "Product"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purchase" ADD CONSTRAINT "Purchase_priceId_fkey" FOREIGN KEY ("priceId") REFERENCES "Price"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEngagement" ADD CONSTRAINT "UserEngagement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserEngagement" ADD CONSTRAINT "UserEngagement_targetUserId_fkey" FOREIGN KEY ("targetUserId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserMetric" ADD CONSTRAINT "UserMetric_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserLink" ADD CONSTRAINT "UserLink_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Import" ADD CONSTRAINT "Import_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Import" ADD CONSTRAINT "Import_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Import"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Model" ADD CONSTRAINT "Model_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Model" ADD CONSTRAINT "Model_fromImportId_fkey" FOREIGN KEY ("fromImportId") REFERENCES "Import"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Model" ADD CONSTRAINT "Model_deletedBy_fkey" FOREIGN KEY ("deletedBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelFlag" ADD CONSTRAINT "ModelFlag_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelInterest" ADD CONSTRAINT "ModelInterest_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelInterest" ADD CONSTRAINT "ModelInterest_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelEngagement" ADD CONSTRAINT "ModelEngagement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelEngagement" ADD CONSTRAINT "ModelEngagement_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersionSponsorshipSettings" ADD CONSTRAINT "ModelVersionSponsorshipSettings_modelVersionMonetizationId_fkey" FOREIGN KEY ("modelVersionMonetizationId") REFERENCES "ModelVersionMonetization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersionMonetization" ADD CONSTRAINT "ModelVersionMonetization_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersion" ADD CONSTRAINT "ModelVersion_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersion" ADD CONSTRAINT "ModelVersion_vaeId_fkey" FOREIGN KEY ("vaeId") REFERENCES "ModelVersion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersion" ADD CONSTRAINT "ModelVersion_fromImportId_fkey" FOREIGN KEY ("fromImportId") REFERENCES "Import"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersionEngagement" ADD CONSTRAINT "ModelVersionEngagement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersionEngagement" ADD CONSTRAINT "ModelVersionEngagement_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecommendedResource" ADD CONSTRAINT "RecommendedResource_resourceId_fkey" FOREIGN KEY ("resourceId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RecommendedResource" ADD CONSTRAINT "RecommendedResource_sourceId_fkey" FOREIGN KEY ("sourceId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelFileHash" ADD CONSTRAINT "ModelFileHash_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "ModelFile"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelFile" ADD CONSTRAINT "ModelFile_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelMetric" ADD CONSTRAINT "ModelMetric_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersionMetric" ADD CONSTRAINT "ModelVersionMetric_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelMetricDaily" ADD CONSTRAINT "ModelMetricDaily_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelMetricDaily" ADD CONSTRAINT "ModelMetricDaily_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelAssociations" ADD CONSTRAINT "ModelAssociations_fromModelId_fkey" FOREIGN KEY ("fromModelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelAssociations" ADD CONSTRAINT "ModelAssociations_toModelId_fkey" FOREIGN KEY ("toModelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelAssociations" ADD CONSTRAINT "ModelAssociations_toArticleId_fkey" FOREIGN KEY ("toArticleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DownloadHistory" ADD CONSTRAINT "DownloadHistory_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DownloadHistory" ADD CONSTRAINT "DownloadHistory_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Report" ADD CONSTRAINT "Report_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceReviewReport" ADD CONSTRAINT "ResourceReviewReport_resourceReviewId_fkey" FOREIGN KEY ("resourceReviewId") REFERENCES "ResourceReview"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceReviewReport" ADD CONSTRAINT "ResourceReviewReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelReport" ADD CONSTRAINT "ModelReport_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelReport" ADD CONSTRAINT "ModelReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentReport" ADD CONSTRAINT "CommentReport_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "Comment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentReport" ADD CONSTRAINT "CommentReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentV2Report" ADD CONSTRAINT "CommentV2Report_commentV2Id_fkey" FOREIGN KEY ("commentV2Id") REFERENCES "CommentV2"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentV2Report" ADD CONSTRAINT "CommentV2Report_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageReport" ADD CONSTRAINT "ImageReport_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageReport" ADD CONSTRAINT "ImageReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleReport" ADD CONSTRAINT "ArticleReport_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleReport" ADD CONSTRAINT "ArticleReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostReport" ADD CONSTRAINT "PostReport_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostReport" ADD CONSTRAINT "PostReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserReport" ADD CONSTRAINT "UserReport_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserReport" ADD CONSTRAINT "UserReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionReport" ADD CONSTRAINT "CollectionReport_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionReport" ADD CONSTRAINT "CollectionReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyReport" ADD CONSTRAINT "BountyReport_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyReport" ADD CONSTRAINT "BountyReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntryReport" ADD CONSTRAINT "BountyEntryReport_bountyEntryId_fkey" FOREIGN KEY ("bountyEntryId") REFERENCES "BountyEntry"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntryReport" ADD CONSTRAINT "BountyEntryReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatReport" ADD CONSTRAINT "ChatReport_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatReport" ADD CONSTRAINT "ChatReport_reportId_fkey" FOREIGN KEY ("reportId") REFERENCES "Report"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceReview" ADD CONSTRAINT "ResourceReview_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceReview" ADD CONSTRAINT "ResourceReview_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceReview" ADD CONSTRAINT "ResourceReview_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceReviewReaction" ADD CONSTRAINT "ResourceReviewReaction_reviewId_fkey" FOREIGN KEY ("reviewId") REFERENCES "ResourceReview"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceReviewReaction" ADD CONSTRAINT "ResourceReviewReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostMetric" ADD CONSTRAINT "PostMetric_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Image" ADD CONSTRAINT "Image_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagesOnReviews" ADD CONSTRAINT "ImagesOnReviews_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagesOnReviews" ADD CONSTRAINT "ImagesOnReviews_reviewId_fkey" FOREIGN KEY ("reviewId") REFERENCES "Review"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagesOnReviews" ADD CONSTRAINT "ImagesOnReviews_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagesOnModels" ADD CONSTRAINT "ImagesOnModels_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImagesOnModels" ADD CONSTRAINT "ImagesOnModels_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageFlag" ADD CONSTRAINT "ImageFlag_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageConnection" ADD CONSTRAINT "ImageConnection_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageEngagement" ADD CONSTRAINT "ImageEngagement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageEngagement" ADD CONSTRAINT "ImageEngagement_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageResource" ADD CONSTRAINT "ImageResource_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageResource" ADD CONSTRAINT "ImageResource_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageResourceNew" ADD CONSTRAINT "ImageResourceNew_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageResourceNew" ADD CONSTRAINT "ImageResourceNew_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageMetric" ADD CONSTRAINT "ImageMetric_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageRatingRequest" ADD CONSTRAINT "ImageRatingRequest_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageRatingRequest" ADD CONSTRAINT "ImageRatingRequest_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionMetric" ADD CONSTRAINT "CollectionMetric_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnTags" ADD CONSTRAINT "TagsOnTags_fromTagId_fkey" FOREIGN KEY ("fromTagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnTags" ADD CONSTRAINT "TagsOnTags_toTagId_fkey" FOREIGN KEY ("toTagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnModels" ADD CONSTRAINT "TagsOnModels_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnModels" ADD CONSTRAINT "TagsOnModels_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnModelsVote" ADD CONSTRAINT "TagsOnModelsVote_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnModelsVote" ADD CONSTRAINT "TagsOnModelsVote_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnModelsVote" ADD CONSTRAINT "TagsOnModelsVote_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnQuestions" ADD CONSTRAINT "TagsOnQuestions_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnQuestions" ADD CONSTRAINT "TagsOnQuestions_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnImageNew" ADD CONSTRAINT "TagsOnImageNew_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnImageVote" ADD CONSTRAINT "TagsOnImageVote_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnImageVote" ADD CONSTRAINT "TagsOnImageVote_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnImageVote" ADD CONSTRAINT "TagsOnImageVote_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnPost" ADD CONSTRAINT "TagsOnPost_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnPost" ADD CONSTRAINT "TagsOnPost_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnArticle" ADD CONSTRAINT "TagsOnArticle_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnArticle" ADD CONSTRAINT "TagsOnArticle_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnBounty" ADD CONSTRAINT "TagsOnBounty_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnBounty" ADD CONSTRAINT "TagsOnBounty_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnPostVote" ADD CONSTRAINT "TagsOnPostVote_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnPostVote" ADD CONSTRAINT "TagsOnPostVote_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnPostVote" ADD CONSTRAINT "TagsOnPostVote_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagMetric" ADD CONSTRAINT "TagMetric_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedModel" ADD CONSTRAINT "SavedModel_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SavedModel" ADD CONSTRAINT "SavedModel_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RunStrategy" ADD CONSTRAINT "RunStrategy_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RunStrategy" ADD CONSTRAINT "RunStrategy_partnerId_fkey" FOREIGN KEY ("partnerId") REFERENCES "Partner"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ApiKey" ADD CONSTRAINT "ApiKey_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AdToken" ADD CONSTRAINT "AdToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_parentId_fkey" FOREIGN KEY ("parentId") REFERENCES "Comment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentReaction" ADD CONSTRAINT "CommentReaction_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "Comment"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentReaction" ADD CONSTRAINT "CommentReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserNotificationSettings" ADD CONSTRAINT "UserNotificationSettings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Webhook" ADD CONSTRAINT "Webhook_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Question" ADD CONSTRAINT "Question_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Question" ADD CONSTRAINT "Question_selectedAnswerId_fkey" FOREIGN KEY ("selectedAnswerId") REFERENCES "Answer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuestionMetric" ADD CONSTRAINT "QuestionMetric_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Answer" ADD CONSTRAINT "Answer_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AnswerVote" ADD CONSTRAINT "AnswerVote_answerId_fkey" FOREIGN KEY ("answerId") REFERENCES "Answer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AnswerVote" ADD CONSTRAINT "AnswerVote_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AnswerMetric" ADD CONSTRAINT "AnswerMetric_answerId_fkey" FOREIGN KEY ("answerId") REFERENCES "Answer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentV2" ADD CONSTRAINT "CommentV2_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentV2" ADD CONSTRAINT "CommentV2_threadId_fkey" FOREIGN KEY ("threadId") REFERENCES "Thread"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_parentThreadId_fkey" FOREIGN KEY ("parentThreadId") REFERENCES "Thread"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_rootThreadId_fkey" FOREIGN KEY ("rootThreadId") REFERENCES "Thread"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_answerId_fkey" FOREIGN KEY ("answerId") REFERENCES "Answer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_reviewId_fkey" FOREIGN KEY ("reviewId") REFERENCES "ResourceReview"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "CommentV2"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_bountyEntryId_fkey" FOREIGN KEY ("bountyEntryId") REFERENCES "BountyEntry"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Thread" ADD CONSTRAINT "Thread_clubPostId_fkey" FOREIGN KEY ("clubPostId") REFERENCES "ClubPost"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuestionReaction" ADD CONSTRAINT "QuestionReaction_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuestionReaction" ADD CONSTRAINT "QuestionReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AnswerReaction" ADD CONSTRAINT "AnswerReaction_answerId_fkey" FOREIGN KEY ("answerId") REFERENCES "Answer"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AnswerReaction" ADD CONSTRAINT "AnswerReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentV2Reaction" ADD CONSTRAINT "CommentV2Reaction_commentId_fkey" FOREIGN KEY ("commentId") REFERENCES "CommentV2"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CommentV2Reaction" ADD CONSTRAINT "CommentV2Reaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageReaction" ADD CONSTRAINT "ImageReaction_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageReaction" ADD CONSTRAINT "ImageReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostReaction" ADD CONSTRAINT "PostReaction_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostReaction" ADD CONSTRAINT "PostReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleReaction" ADD CONSTRAINT "ArticleReaction_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleReaction" ADD CONSTRAINT "ArticleReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagEngagement" ADD CONSTRAINT "TagEngagement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagEngagement" ADD CONSTRAINT "TagEngagement_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCosmetic" ADD CONSTRAINT "UserCosmetic_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCosmetic" ADD CONSTRAINT "UserCosmetic_cosmeticId_fkey" FOREIGN KEY ("cosmeticId") REFERENCES "Cosmetic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CosmeticShopSection" ADD CONSTRAINT "CosmeticShopSection_addedById_fkey" FOREIGN KEY ("addedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CosmeticShopSection" ADD CONSTRAINT "CosmeticShopSection_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CosmeticShopItem" ADD CONSTRAINT "CosmeticShopItem_cosmeticId_fkey" FOREIGN KEY ("cosmeticId") REFERENCES "Cosmetic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CosmeticShopItem" ADD CONSTRAINT "CosmeticShopItem_addedById_fkey" FOREIGN KEY ("addedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CosmeticShopSectionItem" ADD CONSTRAINT "CosmeticShopSectionItem_shopItemId_fkey" FOREIGN KEY ("shopItemId") REFERENCES "CosmeticShopItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CosmeticShopSectionItem" ADD CONSTRAINT "CosmeticShopSectionItem_shopSectionId_fkey" FOREIGN KEY ("shopSectionId") REFERENCES "CosmeticShopSection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCosmeticShopPurchases" ADD CONSTRAINT "UserCosmeticShopPurchases_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCosmeticShopPurchases" ADD CONSTRAINT "UserCosmeticShopPurchases_cosmeticId_fkey" FOREIGN KEY ("cosmeticId") REFERENCES "Cosmetic"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserCosmeticShopPurchases" ADD CONSTRAINT "UserCosmeticShopPurchases_shopItemId_fkey" FOREIGN KEY ("shopItemId") REFERENCES "CosmeticShopItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_coverId_fkey" FOREIGN KEY ("coverId") REFERENCES "Image"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleEngagement" ADD CONSTRAINT "ArticleEngagement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleEngagement" ADD CONSTRAINT "ArticleEngagement_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleMetric" ADD CONSTRAINT "ArticleMetric_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaderboardResult" ADD CONSTRAINT "LeaderboardResult_leaderboardId_fkey" FOREIGN KEY ("leaderboardId") REFERENCES "Leaderboard"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LeaderboardResult" ADD CONSTRAINT "LeaderboardResult_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelVersionExploration" ADD CONSTRAINT "ModelVersionExploration_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Collection" ADD CONSTRAINT "Collection_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Collection" ADD CONSTRAINT "Collection_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItem" ADD CONSTRAINT "CollectionItem_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItem" ADD CONSTRAINT "CollectionItem_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItem" ADD CONSTRAINT "CollectionItem_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItem" ADD CONSTRAINT "CollectionItem_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItem" ADD CONSTRAINT "CollectionItem_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItem" ADD CONSTRAINT "CollectionItem_addedById_fkey" FOREIGN KEY ("addedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItem" ADD CONSTRAINT "CollectionItem_reviewedById_fkey" FOREIGN KEY ("reviewedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItem" ADD CONSTRAINT "CollectionItem_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItemScore" ADD CONSTRAINT "CollectionItemScore_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionItemScore" ADD CONSTRAINT "CollectionItemScore_collectionItemId_fkey" FOREIGN KEY ("collectionItemId") REFERENCES "CollectionItem"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionContributor" ADD CONSTRAINT "CollectionContributor_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionContributor" ADD CONSTRAINT "CollectionContributor_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnCollection" ADD CONSTRAINT "TagsOnCollection_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnCollection" ADD CONSTRAINT "TagsOnCollection_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HomeBlock" ADD CONSTRAINT "HomeBlock_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "HomeBlock" ADD CONSTRAINT "HomeBlock_sourceId_fkey" FOREIGN KEY ("sourceId") REFERENCES "HomeBlock"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bounty" ADD CONSTRAINT "Bounty_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntry" ADD CONSTRAINT "BountyEntry_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntry" ADD CONSTRAINT "BountyEntry_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntryReaction" ADD CONSTRAINT "BountyEntryReaction_bountyEntryId_fkey" FOREIGN KEY ("bountyEntryId") REFERENCES "BountyEntry"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntryReaction" ADD CONSTRAINT "BountyEntryReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyBenefactor" ADD CONSTRAINT "BountyBenefactor_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyBenefactor" ADD CONSTRAINT "BountyBenefactor_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyBenefactor" ADD CONSTRAINT "BountyBenefactor_awardedToId_fkey" FOREIGN KEY ("awardedToId") REFERENCES "BountyEntry"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEngagement" ADD CONSTRAINT "BountyEngagement_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEngagement" ADD CONSTRAINT "BountyEngagement_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyMetric" ADD CONSTRAINT "BountyMetric_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntryMetric" ADD CONSTRAINT "BountyEntryMetric_bountyEntryId_fkey" FOREIGN KEY ("bountyEntryId") REFERENCES "BountyEntry"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EntityAccess" ADD CONSTRAINT "EntityAccess_addedById_fkey" FOREIGN KEY ("addedById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EntityCollaborator" ADD CONSTRAINT "EntityCollaborator_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EntityCollaborator" ADD CONSTRAINT "EntityCollaborator_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Club" ADD CONSTRAINT "Club_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Club" ADD CONSTRAINT "Club_coverImageId_fkey" FOREIGN KEY ("coverImageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Club" ADD CONSTRAINT "Club_headerImageId_fkey" FOREIGN KEY ("headerImageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Club" ADD CONSTRAINT "Club_avatarId_fkey" FOREIGN KEY ("avatarId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubTier" ADD CONSTRAINT "ClubTier_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubTier" ADD CONSTRAINT "ClubTier_coverImageId_fkey" FOREIGN KEY ("coverImageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubAdminInvite" ADD CONSTRAINT "ClubAdminInvite_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubAdmin" ADD CONSTRAINT "ClubAdmin_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubAdmin" ADD CONSTRAINT "ClubAdmin_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubMembership" ADD CONSTRAINT "ClubMembership_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubMembership" ADD CONSTRAINT "ClubMembership_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubMembership" ADD CONSTRAINT "ClubMembership_clubTierId_fkey" FOREIGN KEY ("clubTierId") REFERENCES "ClubTier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubMembership" ADD CONSTRAINT "ClubMembership_downgradeClubTierId_fkey" FOREIGN KEY ("downgradeClubTierId") REFERENCES "ClubTier"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubPost" ADD CONSTRAINT "ClubPost_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubPost" ADD CONSTRAINT "ClubPost_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubPost" ADD CONSTRAINT "ClubPost_coverImageId_fkey" FOREIGN KEY ("coverImageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubPostReaction" ADD CONSTRAINT "ClubPostReaction_clubPostId_fkey" FOREIGN KEY ("clubPostId") REFERENCES "ClubPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubPostReaction" ADD CONSTRAINT "ClubPostReaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubPostMetric" ADD CONSTRAINT "ClubPostMetric_clubPostId_fkey" FOREIGN KEY ("clubPostId") REFERENCES "ClubPost"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubMetric" ADD CONSTRAINT "ClubMetric_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_ownerId_fkey" FOREIGN KEY ("ownerId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatMember" ADD CONSTRAINT "ChatMember_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatMember" ADD CONSTRAINT "ChatMember_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatMember" ADD CONSTRAINT "ChatMember_lastViewedMessageId_fkey" FOREIGN KEY ("lastViewedMessageId") REFERENCES "ChatMessage"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatMessage" ADD CONSTRAINT "ChatMessage_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatMessage" ADD CONSTRAINT "ChatMessage_chatId_fkey" FOREIGN KEY ("chatId") REFERENCES "Chat"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ChatMessage" ADD CONSTRAINT "ChatMessage_referenceMessageId_fkey" FOREIGN KEY ("referenceMessageId") REFERENCES "ChatMessage"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BuildGuide" ADD CONSTRAINT "BuildGuide_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchasableReward" ADD CONSTRAINT "PurchasableReward_addedById_fkey" FOREIGN KEY ("addedById") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PurchasableReward" ADD CONSTRAINT "PurchasableReward_coverImageId_fkey" FOREIGN KEY ("coverImageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserPurchasedRewards" ADD CONSTRAINT "UserPurchasedRewards_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserPurchasedRewards" ADD CONSTRAINT "UserPurchasedRewards_purchasableRewardId_fkey" FOREIGN KEY ("purchasableRewardId") REFERENCES "PurchasableReward"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaultItem" ADD CONSTRAINT "VaultItem_vaultId_fkey" FOREIGN KEY ("vaultId") REFERENCES "Vault"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VaultItem" ADD CONSTRAINT "VaultItem_creatorId_fkey" FOREIGN KEY ("creatorId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Vault" ADD CONSTRAINT "Vault_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RedeemableCode" ADD CONSTRAINT "RedeemableCode_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageTool" ADD CONSTRAINT "ImageTool_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageTool" ADD CONSTRAINT "ImageTool_toolId_fkey" FOREIGN KEY ("toolId") REFERENCES "Tool"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageTechnique" ADD CONSTRAINT "ImageTechnique_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageTechnique" ADD CONSTRAINT "ImageTechnique_techniqueId_fkey" FOREIGN KEY ("techniqueId") REFERENCES "Technique"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DonationGoal" ADD CONSTRAINT "DonationGoal_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DonationGoal" ADD CONSTRAINT "DonationGoal_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Donation" ADD CONSTRAINT "Donation_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Donation" ADD CONSTRAINT "Donation_donationGoalId_fkey" FOREIGN KEY ("donationGoalId") REFERENCES "DonationGoal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appeal" ADD CONSTRAINT "Appeal_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Appeal" ADD CONSTRAINT "Appeal_resolvedBy_fkey" FOREIGN KEY ("resolvedBy") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Auction" ADD CONSTRAINT "Auction_auctionBaseId_fkey" FOREIGN KEY ("auctionBaseId") REFERENCES "AuctionBase"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bid" ADD CONSTRAINT "Bid_auctionId_fkey" FOREIGN KEY ("auctionId") REFERENCES "Auction"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Bid" ADD CONSTRAINT "Bid_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BidRecurring" ADD CONSTRAINT "BidRecurring_auctionBaseId_fkey" FOREIGN KEY ("auctionBaseId") REFERENCES "AuctionBase"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BidRecurring" ADD CONSTRAINT "BidRecurring_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FeaturedModelVersion" ADD CONSTRAINT "FeaturedModelVersion_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoveredCheckpoint" ADD CONSTRAINT "CoveredCheckpoint_model_id_fkey" FOREIGN KEY ("model_id") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoveredCheckpoint" ADD CONSTRAINT "CoveredCheckpoint_version_id_fkey" FOREIGN KEY ("version_id") REFERENCES "ModelVersion"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModerationRule" ADD CONSTRAINT "ModerationRule_createdById_fkey" FOREIGN KEY ("createdById") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewOrderPlayer" ADD CONSTRAINT "NewOrderPlayer_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewOrderPlayer" ADD CONSTRAINT "NewOrderPlayer_rankType_fkey" FOREIGN KEY ("rankType") REFERENCES "NewOrderRank"("type") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewOrderSmite" ADD CONSTRAINT "NewOrderSmite_targetPlayerId_fkey" FOREIGN KEY ("targetPlayerId") REFERENCES "NewOrderPlayer"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NewOrderSmite" ADD CONSTRAINT "NewOrderSmite_givenById_fkey" FOREIGN KEY ("givenById") REFERENCES "NewOrderPlayer"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuestionRank" ADD CONSTRAINT "QuestionRank_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AnswerRank" ADD CONSTRAINT "AnswerRank_answerId_fkey" FOREIGN KEY ("answerId") REFERENCES "Answer"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelReportStat" ADD CONSTRAINT "ModelReportStat_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleStat" ADD CONSTRAINT "ArticleStat_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ArticleRank" ADD CONSTRAINT "ArticleRank_articleId_fkey" FOREIGN KEY ("articleId") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserStat" ADD CONSTRAINT "UserStat_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserRank" ADD CONSTRAINT "UserRank_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagStat" ADD CONSTRAINT "TagStat_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagRank" ADD CONSTRAINT "TagRank_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageStat" ADD CONSTRAINT "ImageStat_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageModHelper" ADD CONSTRAINT "ImageModHelper_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelHash" ADD CONSTRAINT "ModelHash_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelHash" ADD CONSTRAINT "ModelHash_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostHelper" ADD CONSTRAINT "PostHelper_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostStat" ADD CONSTRAINT "PostStat_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionStat" ADD CONSTRAINT "CollectionStat_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CollectionRank" ADD CONSTRAINT "CollectionRank_collectionId_fkey" FOREIGN KEY ("collectionId") REFERENCES "Collection"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageTag" ADD CONSTRAINT "ImageTag_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageTag" ADD CONSTRAINT "ImageTag_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelTag" ADD CONSTRAINT "ModelTag_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ModelTag" ADD CONSTRAINT "ModelTag_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ImageResourceHelper" ADD CONSTRAINT "ImageResourceHelper_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostResourceHelper" ADD CONSTRAINT "PostResourceHelper_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostImageTag" ADD CONSTRAINT "PostImageTag_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostTag" ADD CONSTRAINT "PostTag_postId_fkey" FOREIGN KEY ("postId") REFERENCES "Post"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PostTag" ADD CONSTRAINT "PostTag_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResourceReviewHelper" ADD CONSTRAINT "ResourceReviewHelper_resourceReviewId_fkey" FOREIGN KEY ("resourceReviewId") REFERENCES "ResourceReview"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GenerationCoverage" ADD CONSTRAINT "GenerationCoverage_modelId_fkey" FOREIGN KEY ("modelId") REFERENCES "Model"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "GenerationCoverage" ADD CONSTRAINT "GenerationCoverage_modelVersionId_fkey" FOREIGN KEY ("modelVersionId") REFERENCES "ModelVersion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserProfile" ADD CONSTRAINT "UserProfile_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserProfile" ADD CONSTRAINT "UserProfile_coverImageId_fkey" FOREIGN KEY ("coverImageId") REFERENCES "Image"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyStat" ADD CONSTRAINT "BountyStat_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyRank" ADD CONSTRAINT "BountyRank_bountyId_fkey" FOREIGN KEY ("bountyId") REFERENCES "Bounty"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntryStat" ADD CONSTRAINT "BountyEntryStat_bountyEntryId_fkey" FOREIGN KEY ("bountyEntryId") REFERENCES "BountyEntry"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BountyEntryRank" ADD CONSTRAINT "BountyEntryRank_bountyEntryId_fkey" FOREIGN KEY ("bountyEntryId") REFERENCES "BountyEntry"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubStat" ADD CONSTRAINT "ClubStat_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ClubRank" ADD CONSTRAINT "ClubRank_clubId_fkey" FOREIGN KEY ("clubId") REFERENCES "Club"("id") ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnImageDetails" ADD CONSTRAINT "TagsOnImageDetails_imageId_fkey" FOREIGN KEY ("imageId") REFERENCES "Image"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TagsOnImageDetails" ADD CONSTRAINT "TagsOnImageDetails_tagId_fkey" FOREIGN KEY ("tagId") REFERENCES "Tag"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LicenseToModel" ADD CONSTRAINT "_LicenseToModel_A_fkey" FOREIGN KEY ("A") REFERENCES "License"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_LicenseToModel" ADD CONSTRAINT "_LicenseToModel_B_fkey" FOREIGN KEY ("B") REFERENCES "Model"("id") ON DELETE CASCADE ON UPDATE CASCADE;
