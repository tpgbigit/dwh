/****** Object:  Table [ADF].[ETL_BATCH]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADF].[ETL_BATCH]
(
	[BATCH_ID] [bigint] NOT NULL,
	[BATCH_TYPE] [varchar](50) NOT NULL,
	[BATCH_STATUS] [varchar](50) NOT NULL,
	[START_TS] [datetime] NOT NULL,
	[END_TS] [datetime] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [ADF].[ETL_DATASOURCE]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADF].[ETL_DATASOURCE]
(
	[DATASOURCE_NUM_ID] [bigint] NULL,
	[DATASOURCE_NAME] [varchar](50) NULL,
	[DATASOURCE_VALUE] [varchar](10) NULL,
	[ACTIVE_FLG] [char](1) NULL,
	[CREATED_DT] [date] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [ADF].[ETL_JOB]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADF].[ETL_JOB]
(
	[JOB_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[JOB_NAME] [varchar](200) NOT NULL,
	[JOB_DESC] [varchar](200) NULL,
	[JOB_GROUP] [varchar](200) NOT NULL,
	[JOB_SUB_GROUP] [varchar](200) NOT NULL,
	[JOB_TYPE] [varchar](25) NULL,
	[SOURCE_SCHEMA] [varchar](20) NULL,
	[SOURCE_TABLE] [varchar](100) NULL,
	[TARGET_SCHEMA] [varchar](20) NULL,
	[TARGET_TABLE] [varchar](100) NULL,
	[JOB_SCRIPT] [varchar](8000) NULL,
	[PRUNE_DAYS] [int] NULL,
	[FULL_LOAD_FLG] [char](1) NULL,
	[DATASOURCE_NUM_ID] [int] NOT NULL,
	[ACTIVE_FLG] [char](1) NULL,
	[CREATED_TS] [datetime] NULL,
	[LAST_UPDATED_TS] [datetime] NULL,
	[LAST_EXTRACT_DATE] [datetime] NULL,
	[SHEET_NAME] [nvarchar](500) NULL,
	[IS_NO_HEADER] [varchar](1) NULL,
	[API_GROUP] [varchar](100) NULL,
	[ORDER] [int] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [ADF].[ETL_LOG]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADF].[ETL_LOG]
(
	[LOG_ID] [bigint] IDENTITY(1,1) NOT NULL,
	[BATCH_ID] [bigint] NOT NULL,
	[JOB_ID] [bigint] NULL,
	[LOG_STATUS] [varchar](10) NOT NULL,
	[LOG_MESSAGE] [varchar](4000) NULL,
	[ERROR_CODE] [varchar](4000) NULL,
	[ERROR_MESSAGE] [varchar](4000) NULL,
	[CREATED_TS] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [ADF].[ETL_SSAS_REFRESH]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ADF].[ETL_SSAS_REFRESH]
(
	[REFRESH_ID] [int] IDENTITY(1,1) NOT NULL,
	[TABLE_NAME] [varchar](200) NULL,
	[PARTITION_NAME] [varchar](200) NULL,
	[TYPE_NAME] [varchar](100) NULL,
	[COMMIT_MODE] [varchar](100) NULL,
	[PARALLELISM] [int] NULL,
	[RETRY_COUNT] [int] NULL,
	[ACTIVE_FLG] [varchar](1) NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[GROUP_NAME] [varchar](60) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[VW_HAR_SALES_Fact_bk]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[VW_HAR_SALES_Fact_bk]
(
	[Date Key] [bigint] NULL,
	[Time Key] [bigint] NULL,
	[Customer Key] [bigint] NULL,
	[Customer Type] [nvarchar](6) NULL,
	[Unique Flag] [int] NOT NULL,
	[Store Key] [bigint] NULL,
	[Product Key] [bigint] NULL,
	[Promotion Key] [bigint] NOT NULL,
	[Discount Key] [bigint] NOT NULL,
	[Payment Key] [bigint] NULL,
	[Line ID] [bigint] NULL,
	[Bill Number] [nvarchar](200) NULL,
	[Ref Bill Number] [varchar](100) NULL,
	[Order ID] [bigint] NULL,
	[Ref Order Id] [bigint] NULL,
	[SKU] [nvarchar](200) NULL,
	[Unit Price] [float] NULL,
	[Price Range] [varchar](11) NULL,
	[Price Range No] [int] NULL,
	[Price Original] [float] NULL,
	[Quantity] [int] NULL,
	[Line Amount] [float] NULL,
	[Net Amount] [float] NULL,
	[Promotion Amount] [float] NULL,
	[Discount Amount] [float] NULL,
	[Paid Amount] [float] NULL,
	[Return Quantity] [int] NULL,
	[Return Amount] [float] NULL,
	[Cancelled Status] [varchar](50) NULL,
	[Financial Status] [varchar](50) NULL,
	[Confirmed Status] [varchar](50) NULL,
	[Shipping Code] [nvarchar](500) NULL,
	[Redeem Type] [nvarchar](200) NULL,
	[Redeem Name] [nvarchar](500) NULL,
	[Redeem Used Amount] [float] NULL,
	[Source Name] [varchar](100) NULL,
	[UTM Source] [nvarchar](100) NULL,
	[UTM Medium] [nvarchar](200) NULL,
	[UTM Campaign] [nvarchar](200) NULL,
	[UTM Term] [nvarchar](100) NULL,
	[UTM Content] [nvarchar](200) NULL,
	[Shipping Flag] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[VW_MRP_SALES_ORDER_F_bk]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[VW_MRP_SALES_ORDER_F_bk]
(
	[Date Key] [bigint] NULL,
	[Contract Key] [bigint] NULL,
	[Contract Type Key] [bigint] NULL,
	[Production Type] [varchar](50) NULL,
	[Item Key] [bigint] NULL,
	[Item Id] [bigint] NULL,
	[Customer Key] [bigint] NULL,
	[Factory Key] [bigint] NULL,
	[Po Id] [bigint] NULL,
	[PO Number] [varchar](100) NULL,
	[PO-Country] [nvarchar](201) NULL,
	[PO Batch] [varchar](100) NULL,
	[Po Created Date] [datetime] NULL,
	[Customer Delivery Plan Date] [datetime] NULL,
	[TPG Delivery Plan Date] [datetime] NULL,
	[PO Source] [varchar](50) NULL,
	[PO Status] [varchar](50) NULL,
	[PO Number Ref] [varchar](100) NULL,
	[Color Code] [varchar](50) NULL,
	[Color] [varchar](100) NULL,
	[Style] [varchar](100) NULL,
	[Sub Style] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Country] [nvarchar](100) NULL,
	[Division] [nvarchar](100) NULL,
	[Label] [varchar](50) NULL,
	[Hanger] [varchar](100) NULL,
	[Season] [nvarchar](100) NULL,
	[Mode Price] [varchar](10) NULL,
	[Quantity Dz] [float] NULL,
	[Price Dz] [float] NULL,
	[UC] [float] NULL,
	[Discount Percent] [float] NULL,
	[Quantity Pcs] [int] NULL,
	[Order Quantity] [int] NULL,
	[FOB Order Price] [float] NULL,
	[CM Order Price] [float] NULL,
	[FOB/CM Order Price] [float] NULL,
	[FOB Order Amount] [float] NULL,
	[CM Order Amount] [float] NULL,
	[FOB/CM Order Amount] [float] NULL,
	[Vendor Code] [nvarchar](100) NOT NULL,
	[Exchange Rate] [float] NULL,
	[PO Packing Quantity Pcs] [int] NULL,
	[Source] [varchar](50) NULL,
	[Shortship Flag] [varchar](1) NULL,
	[Overship Quantity] [int] NULL,
	[Overship Amount] [float] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_CALENDAR_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_CALENDAR_D]
(
	[DATE_WID] [bigint] NULL,
	[IS_WORKING_DAY] [varchar](1) NULL,
	[W_DELETE_FLG] [varchar](1) NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NULL,
	[W_BATCH_ID] [int] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_CF_BANK_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_CF_BANK_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[BANK] [nvarchar](200) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_CF_CURRENCY_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_CF_CURRENCY_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CURRENCY] [nvarchar](200) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_CF_DAILY_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_CF_DAILY_F]
(
	[DATE_WID] [bigint] NULL,
	[BANK_WID] [bigint] NULL,
	[CURRENCY_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[TARGETS] [nvarchar](500) NULL,
	[TOTAL(VND)] [float] NULL,
	[BANK] [nvarchar](200) NULL,
	[CURRENCY] [nvarchar](100) NULL,
	[AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_CF_MONTHLY_ACTUAL_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_CF_MONTHLY_ACTUAL_F]
(
	[DATE_WID] [bigint] NULL,
	[RL_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_EXE_CF_MONTHLY_ADJUSTED_REVENUE_FORECAST_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_EXE_CF_MONTHLY_ADJUSTED_REVENUE_FORECAST_F]
(
	[DATE_WID] [bigint] NULL,
	[TYPE] [nvarchar](100) NULL,
	[CUSTOMER_CODE] [nvarchar](200) NULL,
	[NOTE] [nvarchar](500) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_EXE_CF_MONTHLY_FORECAST_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_EXE_CF_MONTHLY_FORECAST_F]
(
	[DATE_WID] [bigint] NULL,
	[RL_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV0_CODE] [nvarchar](500) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_EXE_CF_MONTHLY_SX_MDK_FORECAST_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_EXE_CF_MONTHLY_SX_MDK_FORECAST_F]
(
	[DATE_WID] [bigint] NULL,
	[BST] [nvarchar](100) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_ADDRESSES_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_ADDRESSES_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[ADDRESS1] [nvarchar](500) NULL,
	[ADDRESS2] [nvarchar](500) NULL,
	[CITY] [nvarchar](100) NULL,
	[COMPANY] [nvarchar](100) NULL,
	[COUNTRY] [nvarchar](100) NULL,
	[COUNTRY_CODE] [nvarchar](100) NULL,
	[CUSTOMER_ID] [bigint] NULL,
	[DEFAULT] [bit] NULL,
	[DISTRICT] [nvarchar](100) NULL,
	[DISTRICT_CODE] [nvarchar](100) NULL,
	[FIRST_NAME] [nvarchar](100) NULL,
	[ID] [bigint] NULL,
	[LAST_NAME] [nvarchar](100) NULL,
	[NAME] [nvarchar](100) NULL,
	[PHONE] [varchar](50) NULL,
	[PROVINCE] [nvarchar](100) NULL,
	[PROVINCE_CODE] [nvarchar](100) NULL,
	[WARD] [nvarchar](100) NULL,
	[WARD_CODE] [nvarchar](100) NULL,
	[ZIP] [int] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_CHANNEL_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_CHANNEL_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CHANNEL_CODE] [varchar](100) NULL,
	[LOCATION_ID] [bigint] NULL,
	[CHANNEL_NAME] [nvarchar](200) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_COLLECTIONS_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_COLLECTIONS_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[BODY_HTML] [varchar](500) NULL,
	[HANDLE] [varchar](500) NULL,
	[ID] [bigint] NULL,
	[TYPE] [varchar](50) NULL,
	[IMAGE] [varchar](500) NULL,
	[PUBLISHED] [bit] NULL,
	[DISJUNCTIVE] [bit] NULL,
	[PUBLISHED_AT] [datetime] NULL,
	[PUBLISHED_SCOPE] [varchar](100) NULL,
	[SORT_ORDER] [varchar](100) NULL,
	[TEMPLATE_SUFFIX] [varchar](100) NULL,
	[TITLE] [nvarchar](500) NULL,
	[UPDATED_AT] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_COLLECTS_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_COLLECTS_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[COLLECTION_WID] [bigint] NULL,
	[PRODUCT_WID] [bigint] NULL,
	[COLLECTION_ID] [bigint] NULL,
	[CREATED_AT] [datetime] NULL,
	[FEATURED] [bit] NULL,
	[ID] [bigint] NULL,
	[POSITION] [int] NULL,
	[PRODUCT_ID] [bigint] NULL,
	[SORT_VALUE] [varchar](100) NULL,
	[UPDATED_AT] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_CUSTOMERS_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_CUSTOMERS_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[ACCEPTS_MARKETING] [bit] NULL,
	[BIRTHDAY] [datetime] NULL,
	[CREATED_AT] [datetime] NULL,
	[DEFAULT_ADDRESS_ID] [bigint] NULL,
	[EMAIL] [varchar](200) NULL,
	[FIRST_NAME] [nvarchar](100) NULL,
	[GENDER] [int] NULL,
	[GROUP_NAME] [nvarchar](200) NULL,
	[ID] [bigint] NULL,
	[LAST_NAME] [nvarchar](100) NULL,
	[LAST_ORDER_DATE] [datetime] NULL,
	[LAST_ORDER_ID] [bigint] NULL,
	[LAST_ORDER_NAME] [varchar](200) NULL,
	[MULTIPASS_IDENTIFIER] [nvarchar](200) NULL,
	[NOTE] [nvarchar](200) NULL,
	[ORDERS_COUNT] [bigint] NULL,
	[PHONE] [varchar](20) NULL,
	[STATE] [varchar](50) NULL,
	[TAGS] [nvarchar](200) NULL,
	[TOTAL_PAID] [float] NULL,
	[TOTAL_SPENT] [float] NULL,
	[UPDATED_AT] [datetime] NULL,
	[VERIFIED_EMAIL] [bit] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_DISCOUNT_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_DISCOUNT_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[APPLIES_ONCE] [bit] NULL,
	[APPLIES_TO_ID] [bigint] NULL,
	[APPLIES_TO_QUANTITY] [int] NULL,
	[APPLIES_TO_RESOURCE] [nvarchar](100) NULL,
	[CHANNEL] [nvarchar](50) NULL,
	[CODE] [nvarchar](200) NULL,
	[CREATE_USER] [bigint] NULL,
	[CREATED_AT] [datetime] NULL,
	[DISCOUNT_TYPE] [nvarchar](100) NULL,
	[ENDS_AT] [datetime] NULL,
	[FIRST_NAME] [nvarchar](100) NULL,
	[ID] [bigint] NULL,
	[IS_ADVANCE_SAME_PRICE_DISCOUNT] [bit] NULL,
	[IS_NEW_COUPON] [bit] NULL,
	[IS_PROMOTION] [bit] NULL,
	[LAST_NAME] [nvarchar](100) NULL,
	[MAX_AMOUNT_APPLY] [float] NULL,
	[MINIMUM_ORDER_AMOUNT] [float] NULL,
	[ORDER_OVER] [nvarchar](200) NULL,
	[PROMOTION_APPLY_TYPE] [nvarchar](100) NULL,
	[STARTS_AT] [datetime] NULL,
	[STATUS] [nvarchar](50) NULL,
	[TIMES_USED] [int] NULL,
	[UPDATED_AT] [datetime] NULL,
	[USAGE_LIMIT] [int] NULL,
	[VALUE] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_IMAGES_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_IMAGES_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CREATED_AT] [datetime] NULL,
	[FILENAME] [varchar](500) NULL,
	[ID] [bigint] NULL,
	[POSITION] [int] NULL,
	[PRODUCT_ID] [bigint] NULL,
	[SRC] [varchar](1000) NULL,
	[UPDATED_AT] [datetime] NULL,
	[VARIANT_IDS] [varchar](500) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_LOCATIONS_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_LOCATIONS_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[ADDRESS1] [nvarchar](500) NULL,
	[ADDRESS2] [nvarchar](500) NULL,
	[CITY] [nvarchar](100) NULL,
	[COUNTRY] [nvarchar](100) NULL,
	[COUNTRY_CODE] [nvarchar](100) NULL,
	[COUNTRY_NAME] [nvarchar](100) NULL,
	[CREATED_AT] [datetime] NULL,
	[DISTRICT] [nvarchar](100) NULL,
	[DISTRICT_CODE] [nvarchar](100) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[ID] [bigint] NULL,
	[IS_PRIMARY] [bit] NULL,
	[IS_UNAVAILABLE_QUANTITY] [bit] NULL,
	[LOCATION_TYPE] [nvarchar](100) NULL,
	[NAME] [nvarchar](200) NULL,
	[PHONE] [varchar](50) NULL,
	[PROVINCE] [nvarchar](100) NULL,
	[PROVINCE_CODE] [nvarchar](100) NULL,
	[TYPE] [nvarchar](100) NULL,
	[UPDATED_AT] [datetime] NULL,
	[WARD] [nvarchar](100) NULL,
	[WARD_CODE] [nvarchar](100) NULL,
	[ZIP] [nvarchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_ORDERS_DISCOUNT_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_ORDERS_DISCOUNT_F]
(
	[ORDER_WID] [bigint] NULL,
	[DISCOUNT_WID] [bigint] NULL,
	[AMOUNT] [float] NULL,
	[CODE] [nvarchar](500) NULL,
	[IS_COUPON_CODE] [bit] NULL,
	[ORDER_ID] [bigint] NULL,
	[TYPE] [varchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_ORDERS_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_ORDERS_F]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE_WID] [bigint] NULL,
	[TIME_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[LOCATION_WID] [bigint] NULL,
	[USER_WID] [bigint] NULL,
	[CHANNEL_WID] [bigint] NULL,
	[BILLING_ADDRESS1] [nvarchar](500) NULL,
	[BILLING_ADDRESS2] [nvarchar](500) NULL,
	[BILLING_CITY] [nvarchar](100) NULL,
	[BILLING_COMPANY] [nvarchar](100) NULL,
	[BILLING_COUNTRY] [nvarchar](100) NULL,
	[BILLING_COUNTRY_CODE] [varchar](50) NULL,
	[BILLING_DEFAULT] [bit] NULL,
	[BILLING_DISTRICT] [nvarchar](100) NULL,
	[BILLING_DISTRICT_CODE] [varchar](50) NULL,
	[BILLING_FIRST_NAME] [nvarchar](100) NULL,
	[BILLING_ID] [bigint] NULL,
	[BILLING_LAST_NAME] [nvarchar](100) NULL,
	[BILLING_NAME] [nvarchar](100) NULL,
	[BILLING_PHONE] [varchar](50) NULL,
	[BILLING_PROVINCE] [nvarchar](100) NULL,
	[BILLING_PROVINCE_CODE] [varchar](50) NULL,
	[BILLING_WARD] [nvarchar](100) NULL,
	[BILLING_WARD_CODE] [varchar](100) NULL,
	[BILLING_ZIP] [varchar](100) NULL,
	[BROWSER_IP] [varchar](50) NULL,
	[BUYER_ACCEPTS_MARKETING] [bit] NULL,
	[CANCEL_REASON] [nvarchar](100) NULL,
	[CANCELLED_AT] [datetime] NULL,
	[CANCELLED_STATUS] [varchar](50) NULL,
	[CART_TOKEN] [varchar](200) NULL,
	[CHECKOUT_TOKEN] [varchar](200) NULL,
	[CLIENT_DETAILS] [varchar](500) NULL,
	[CLOSED_AT] [datetime] NULL,
	[CLOSED_STATUS] [varchar](50) NULL,
	[COMPLETE_AT] [datetime] NULL,
	[CONFIRMED_AT] [datetime] NULL,
	[CONFIRMED_STATUS] [varchar](50) NULL,
	[CREATED_AT] [datetime] NULL,
	[CURRENCY] [varchar](50) NULL,
	[CUSTOMER_ID] [bigint] NULL,
	[DEVICE_ID] [bigint] NULL,
	[EMAIL] [varchar](100) NULL,
	[EXPORT_AT] [datetime] NULL,
	[FINANCIAL_STATUS] [varchar](50) NULL,
	[FULFILLMENT_STATUS] [varchar](50) NULL,
	[GATEWAY] [nvarchar](100) NULL,
	[GATEWAY_CODE] [varchar](50) NULL,
	[ID] [bigint] NULL,
	[IN_STOCK_AT] [nvarchar](100) NULL,
	[LANDING_SITE] [varchar](2000) NULL,
	[LANDING_SITE_REF] [varchar](200) NULL,
	[LOCATION_ASSIGNED_AT] [datetime] NULL,
	[LOCATION_ID] [bigint] NULL,
	[NAME] [varchar](50) NULL,
	[NOTE] [nvarchar](2000) NULL,
	[NOTE_ATTRIBUTES] [nvarchar](2000) NULL,
	[NUMBER] [varchar](50) NULL,
	[OMNI_ORDER_STATUS] [varchar](50) NULL,
	[OMNI_ORDER_STATUS_NAME] [nvarchar](100) NULL,
	[ORDER_NUMBER] [varchar](50) NULL,
	[OUT_OF_STOCK_AT] [datetime] NULL,
	[PROCESSING_METHOD] [nvarchar](100) NULL,
	[REDEEM_MODEL] [nvarchar](1000) NULL,
	[REF_ORDER_ID] [bigint] NULL,
	[REF_ORDER_NUMBER] [varchar](100) NULL,
	[REFERRING_SITE] [varchar](2000) NULL,
	[SHIPPING_ADDRESS1] [nvarchar](500) NULL,
	[SHIPPING_ADDRESS2] [nvarchar](500) NULL,
	[SHIPPING_CITY] [nvarchar](100) NULL,
	[SHIPPING_COMPANY] [nvarchar](100) NULL,
	[SHIPPING_COUNTRY] [nvarchar](100) NULL,
	[SHIPPING_COUNTRY_CODE] [varchar](50) NULL,
	[SHIPPING_DISTRICT] [nvarchar](100) NULL,
	[SHIPPING_DISTRICT_CODE] [varchar](50) NULL,
	[SHIPPING_FIRST_NAME] [nvarchar](100) NULL,
	[SHIPPING_LAST_NAME] [nvarchar](100) NULL,
	[SHIPPING_LATITUDE] [float] NULL,
	[SHIPPING_LONGITUDE] [float] NULL,
	[SHIPPING_NAME] [nvarchar](100) NULL,
	[SHIPPING_PHONE] [varchar](50) NULL,
	[SHIPPING_PROVINCE] [nvarchar](100) NULL,
	[SHIPPING_PROVINCE_CODE] [varchar](50) NULL,
	[SHIPPING_WARD] [nvarchar](100) NULL,
	[SHIPPING_WARD_CODE] [varchar](100) NULL,
	[SHIPPING_ZIP] [varchar](100) NULL,
	[SOURCE] [varchar](100) NULL,
	[SOURCE_NAME] [varchar](100) NULL,
	[SUBTOTAL_PRICE] [float] NULL,
	[TAGS] [nvarchar](100) NULL,
	[TAX_LINES] [nvarchar](100) NULL,
	[TAXES_INCLUDED] [bit] NULL,
	[TOKEN] [varchar](100) NULL,
	[TOTAL_DISCOUNTS] [float] NULL,
	[TOTAL_LINE_ITEMS_PRICE] [float] NULL,
	[TOTAL_PRICE] [float] NULL,
	[TOTAL_TAX] [float] NULL,
	[TOTAL_WEIGHT] [float] NULL,
	[UPDATED_AT] [datetime] NULL,
	[USER_ID] [bigint] NULL,
	[UTM_CAMPAIGN] [nvarchar](200) NULL,
	[UTM_CONTENT] [nvarchar](200) NULL,
	[UTM_MEDIUM] [nvarchar](200) NULL,
	[UTM_SOURCE] [nvarchar](100) NULL,
	[UTM_TERM] [nvarchar](100) NULL,
	[SHIPPING_PRICE] [float] NULL,
	[SHIPPING_CODE] [nvarchar](500) NULL,
	[REDEEM_AMOUNT] [float] NULL,
	[REDEEM_DISCOUNT_TYPE] [nvarchar](200) NULL,
	[REDEEM_NAME] [nvarchar](500) NULL,
	[REDEEM_USED_AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_ORDERS_FULFILLMENTS_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_ORDERS_FULFILLMENTS_F]
(
	[ORDER_WID] [bigint] NULL,
	[ADDRESS] [nvarchar](200) NULL,
	[BOXME_SERVICECODE] [nvarchar](200) NULL,
	[CANCEL_DATE] [datetime] NULL,
	[CARRIER_COD_STATUS_CODE] [varchar](100) NULL,
	[CARRIER_COD_STATUS_NAME] [nvarchar](100) NULL,
	[CARRIER_OPTIONS] [nvarchar](200) NULL,
	[CARRIER_SERVICE_CODE] [nvarchar](200) NULL,
	[CARRIER_SERVICE_PACKAGE] [nvarchar](200) NULL,
	[CARRIER_SERVICE_PACKAGE_NAME] [nvarchar](200) NULL,
	[CARRIER_SHOP_ID] [bigint] NULL,
	[CARRIER_STATUS_CODE] [varchar](100) NULL,
	[CARRIER_STATUS_NAME] [nvarchar](100) NULL,
	[CITY] [nvarchar](100) NULL,
	[COD_AMOUNT] [float] NULL,
	[COD_NOT_RECEIPT_DATE] [datetime] NULL,
	[COD_PAID_DATE] [datetime] NULL,
	[COD_PENDING_DATE] [datetime] NULL,
	[COD_RECEIPT_DATE] [datetime] NULL,
	[COUNTRY] [nvarchar](100) NULL,
	[COUNTRY_CODE] [nvarchar](100) NULL,
	[COUPON_CODE] [varchar](100) NULL,
	[CREATED_AT] [datetime] NULL,
	[DELIVERED_DATE] [datetime] NULL,
	[DELIVERING_DATE] [datetime] NULL,
	[DISTRICT] [nvarchar](100) NULL,
	[DISTRICT_CODE] [nvarchar](100) NULL,
	[FIRST_NAME] [nvarchar](200) NULL,
	[FROM_LATITUDE] [float] NULL,
	[FROM_LONGTITUDE] [float] NULL,
	[ID] [bigint] NULL,
	[INSURANCE_PRICE] [float] NULL,
	[IS_DROP_OFF] [bit] NULL,
	[IS_INSURANCE] [bit] NULL,
	[IS_NEW_SERVICE_PACKAGE] [bit] NULL,
	[IS_OPEN_BOX] [bit] NULL,
	[IS_VIEW_BEFORE] [bit] NULL,
	[LAST_NAME] [nvarchar](200) NULL,
	[LOCATION_ID] [bigint] NULL,
	[NOT_MEET_CUSTOMER_DATE] [nvarchar](200) NULL,
	[NOTE] [nvarchar](1000) NULL,
	[NOTE_ATTRIBUTES] [nvarchar](1000) NULL,
	[NOTIFY_CUSTOMER] [bit] NULL,
	[ORDER_ID] [bigint] NULL,
	[PACKAGE_HEIGHT] [float] NULL,
	[PACKAGE_LENGTH] [float] NULL,
	[PACKAGE_WIDTH] [float] NULL,
	[PICKING_DATE] [datetime] NULL,
	[PROVINCE] [nvarchar](100) NULL,
	[PROVINCE_CODE] [nvarchar](100) NULL,
	[READY_TO_PICK_DATE] [datetime] NULL,
	[REAL_SHIPPING_FEE] [float] NULL,
	[RECEIPT] [nvarchar](100) NULL,
	[REQUEST_ID] [bigint] NULL,
	[RETURN_DATE] [datetime] NULL,
	[SENDER_NAME] [nvarchar](100) NULL,
	[SENDER_PHONE] [nvarchar](100) NULL,
	[SHIPPING_ADDRESS] [nvarchar](500) NULL,
	[SHIPPING_NOTES] [nvarchar](1000) NULL,
	[SHIPPING_PACKAGE] [nvarchar](100) NULL,
	[SHIPPING_PHONE] [nvarchar](100) NULL,
	[SORT_CODE] [nvarchar](100) NULL,
	[STATUS] [nvarchar](100) NULL,
	[TO_LATITUDE] [float] NULL,
	[TO_LONGTITUDE] [float] NULL,
	[TOTAL_WEIGHT] [float] NULL,
	[TRACKING_COMPANY] [nvarchar](200) NULL,
	[TRACKING_COMPANY_CODE] [nvarchar](200) NULL,
	[TRACKING_NUMBER] [nvarchar](200) NULL,
	[TRACKING_URL] [nvarchar](500) NULL,
	[TRANSPORT_TYPE] [nvarchar](100) NULL,
	[UPDATED_AT] [datetime] NULL,
	[WAITING_FOR_RETURN_DATE] [datetime] NULL,
	[WARD] [nvarchar](100) NULL,
	[WARD_CODE] [nvarchar](100) NULL,
	[ZIP_CODE] [nvarchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_ORDERS_LINE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_ORDERS_LINE_F]
(
	[ORDER_WID] [bigint] NULL,
	[VARIANT_WID] [bigint] NULL,
	[PROMOTION_WID] [bigint] NULL,
	[DISCOUNT_WID] [bigint] NULL,
	[APPLIED_DISCOUNTS] [nvarchar](1000) NULL,
	[BARCODE] [varchar](100) NULL,
	[FULFILLABLE_QUANTITY] [int] NULL,
	[FULFILLMENT_SERVICE] [nvarchar](100) NULL,
	[FULFILLMENT_STATUS] [nvarchar](100) NULL,
	[GIFT_CARD] [bit] NULL,
	[GRAMS] [float] NULL,
	[ID] [bigint] NULL,
	[MA_COST_AMOUNT] [float] NULL,
	[NAME] [nvarchar](500) NULL,
	[NOT_ALLOW_PROMOTION] [bit] NULL,
	[ORDER_ID] [bigint] NULL,
	[PRICE] [float] NULL,
	[PRICE_ORIGINAL] [float] NULL,
	[PRICE_PROMOTION] [float] NULL,
	[PRODUCT_EXISTS] [bit] NULL,
	[PRODUCT_ID] [bigint] NULL,
	[PROMOTION_ID] [bigint] NULL,
	[QUANTITY] [int] NULL,
	[RETURN_QUANTITY] [int] NULL,
	[REQUIRES_SHIPPING] [bit] NULL,
	[SKU] [varchar](200) NULL,
	[TAXABLE] [bit] NULL,
	[TITLE] [nvarchar](500) NULL,
	[TOTAL_DISCOUNT] [float] NULL,
	[TYPE] [nvarchar](500) NULL,
	[VARIANT_ID] [bigint] NULL,
	[VARIANT_TITLE] [nvarchar](500) NULL,
	[VENDOR] [nvarchar](100) NULL,
	[DISCOUNT_FLAG] [bit] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_ORDERS_LINE_F_TY]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_ORDERS_LINE_F_TY]
(
	[ORDER_WID] [bigint] NULL,
	[VARIANT_WID] [bigint] NULL,
	[PROMOTION_WID] [bigint] NULL,
	[APPLIED_DISCOUNTS] [nvarchar](1000) NULL,
	[BARCODE] [varchar](100) NULL,
	[FULFILLABLE_QUANTITY] [int] NULL,
	[FULFILLMENT_SERVICE] [nvarchar](100) NULL,
	[FULFILLMENT_STATUS] [nvarchar](100) NULL,
	[GIFT_CARD] [bit] NULL,
	[GRAMS] [float] NULL,
	[ID] [bigint] NULL,
	[MA_COST_AMOUNT] [float] NULL,
	[NAME] [nvarchar](500) NULL,
	[NOT_ALLOW_PROMOTION] [bit] NULL,
	[ORDER_ID] [bigint] NULL,
	[PRICE] [float] NULL,
	[PRICE_ORIGINAL] [float] NULL,
	[PRICE_PROMOTION] [float] NULL,
	[PRODUCT_EXISTS] [bit] NULL,
	[PRODUCT_ID] [bigint] NULL,
	[PROMOTION_ID] [bigint] NULL,
	[QUANTITY] [int] NULL,
	[RETURN_QUANTITY] [int] NULL,
	[REQUIRES_SHIPPING] [bit] NULL,
	[SKU] [varchar](200) NULL,
	[TAXABLE] [bit] NULL,
	[TITLE] [nvarchar](500) NULL,
	[TOTAL_DISCOUNT] [float] NULL,
	[TYPE] [nvarchar](500) NULL,
	[VARIANT_ID] [bigint] NULL,
	[VARIANT_TITLE] [nvarchar](500) NULL,
	[VENDOR] [nvarchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_ORDERS_SHIPPING_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_ORDERS_SHIPPING_F]
(
	[ORDER_WID] [bigint] NULL,
	[CODE] [nvarchar](500) NULL,
	[ORDER_ID] [bigint] NULL,
	[PRICE] [float] NULL,
	[SOURCE] [nvarchar](200) NULL,
	[TITLE] [nvarchar](500) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_ORDERS_TRANSACTIONS_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_ORDERS_TRANSACTIONS_F]
(
	[ORDER_WID] [bigint] NULL,
	[AMOUNT] [float] NULL,
	[AUTHORIZATION] [nvarchar](200) NULL,
	[CREATED_AT] [datetime] NULL,
	[CURRENCY] [varchar](50) NULL,
	[DEVICE_ID] [varchar](100) NULL,
	[EXTERNAL_TRANSACTION_ID] [varchar](100) NULL,
	[GATEWAY] [nvarchar](200) NULL,
	[HARAVAN_TRANSACTION_ID] [varchar](100) NULL,
	[ID] [bigint] NULL,
	[KIND] [varchar](100) NULL,
	[LOCATION_ID] [bigint] NULL,
	[ORDER_ID] [bigint] NULL,
	[PARENT_ID] [bigint] NULL,
	[PAYMENT_DETAILS] [nvarchar](200) NULL,
	[RECEIPT] [nvarchar](200) NULL,
	[REFUND_ID] [bigint] NULL,
	[SEND_EMAIL] [bit] NULL,
	[STATUS] [nvarchar](200) NULL,
	[TEST] [bit] NULL,
	[USER_ID] [bigint] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_PRODUCTS_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_PRODUCTS_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CREATED_AT] [datetime] NULL,
	[HANDLE] [varchar](500) NULL,
	[ID] [bigint] NULL,
	[NOT_ALLOW_PROMOTION] [bit] NULL,
	[ONLY_HIDE_FROM_LIST] [bit] NULL,
	[OPTIONS] [varchar](500) NULL,
	[PRODUCT_TYPE] [nvarchar](100) NULL,
	[PUBLISHED_AT] [datetime] NULL,
	[PUBLISHED_SCOPE] [varchar](50) NULL,
	[TAGS] [nvarchar](500) NULL,
	[TEMPLATE_SUFFIX] [varchar](50) NULL,
	[TITLE] [nvarchar](200) NULL,
	[UPDATED_AT] [datetime] NULL,
	[VENDOR] [nvarchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_PROMOTION_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_PROMOTION_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[APPLIES_CUSTOMER_GROUP_ID] [bigint] NULL,
	[APPLIES_TO_ID] [bigint] NULL,
	[APPLIES_TO_QUANTITY] [int] NULL,
	[APPLIES_TO_RESOURCE] [nvarchar](100) NULL,
	[CREATE_USER] [bigint] NULL,
	[CREATED_AT] [datetime] NULL,
	[DISCOUNT_TYPE] [nvarchar](100) NULL,
	[ENDS_AT] [datetime] NULL,
	[FIRST_NAME] [nvarchar](100) NULL,
	[ID] [bigint] NULL,
	[LAST_NAME] [nvarchar](100) NULL,
	[NAME] [nvarchar](500) NULL,
	[PROMOTION_APPLY_TYPE] [varchar](20) NULL,
	[SET_TIME_ACTIVE] [bit] NULL,
	[STARTS_AT] [datetime] NULL,
	[STATUS] [varchar](50) NULL,
	[UPDATED_AT] [datetime] NULL,
	[VALUE] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_REFUND_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_REFUND_F]
(
	[DATE_WID] [bigint] NULL,
	[ORDER_WID] [bigint] NULL,
	[VARIANT_WID] [bigint] NULL,
	[CREATED_AT] [datetime] NULL,
	[ID] [bigint] NULL,
	[NOTE] [nvarchar](500) NULL,
	[ORDER_ID] [bigint] NULL,
	[RESTOCK] [bit] NULL,
	[USER_ID] [bigint] NULL,
	[VARIANT_ID] [bigint] NULL,
	[QUANTITY] [int] NULL,
	[TOTAL_AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_RULES_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_RULES_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[COLLECTION_WID] [bigint] NULL,
	[COLUMN] [varchar](100) NULL,
	[CONDITION] [nvarchar](100) NULL,
	[RELATION] [varchar](50) NULL,
	[SMART_COLLECTION_ID] [bigint] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_USERS_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_USERS_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[ACCOUNT_OWNER] [bit] NULL,
	[BIO] [nvarchar](200) NULL,
	[EMAIL] [varchar](100) NULL,
	[FIRST_NAME] [nvarchar](100) NULL,
	[ID] [bigint] NULL,
	[IM] [nvarchar](200) NULL,
	[LAST_NAME] [nvarchar](100) NULL,
	[PERMISSIONS] [nvarchar](1000) NULL,
	[PHONE] [varchar](100) NULL,
	[RECEIVE_ANNOUNCEMENTS] [varchar](100) NULL,
	[URL] [varchar](100) NULL,
	[USER_TYPE] [varchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_HAR_VARIANTS_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_HAR_VARIANTS_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[PRODUCT_WID] [bigint] NULL,
	[IMAGE_WID] [bigint] NULL,
	[PRODUCT_MAPPING_WID] [bigint] NULL,
	[BARCODE] [varchar](200) NULL,
	[COMPARE_AT_PRICE] [float] NULL,
	[CREATED_AT] [datetime] NULL,
	[FULFILLMENT_SERVICE] [nvarchar](100) NULL,
	[GRAMS] [float] NULL,
	[ID] [bigint] NULL,
	[IMAGE_ID] [bigint] NULL,
	[INVENTORY_ADVANCE] [nvarchar](100) NULL,
	[INVENTORY_MANAGEMENT] [nvarchar](100) NULL,
	[INVENTORY_POLICY] [varchar](50) NULL,
	[INVENTORY_QUANTITY] [int] NULL,
	[OPTION1] [nvarchar](200) NULL,
	[OPTION2] [nvarchar](200) NULL,
	[OPTION3] [nvarchar](200) NULL,
	[POSITION] [int] NULL,
	[PRICE] [float] NULL,
	[PRODUCT_ID] [bigint] NULL,
	[REQUIRES_SHIPPING] [bit] NULL,
	[SKU] [varchar](100) NULL,
	[TAXABLE] [bit] NULL,
	[TITLE] [nvarchar](200) NULL,
	[UPDATED_AT] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_AP_BALANCE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_AP_BALANCE_F]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE_WID] [bigint] NULL,
	[SUPPLIER_WID] [bigint] NULL,
	[ACCOUNT_WID] [bigint] NULL,
	[RECID] [varchar](100) NULL,
	[SUPPLIER_CODE] [varchar](100) NULL,
	[INVOICE] [varchar](100) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[VENDOR_GROUP] [nvarchar](100) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[TRANSNO] [varchar](100) NULL,
	[TRANSDATE] [datetime] NULL,
	[PAYMENT_TERM] [nvarchar](100) NULL,
	[PAYMENT_METHOD] [nvarchar](100) NULL,
	[DUE_DATE] [datetime] NULL,
	[AP_AMOUNT] [float] NULL,
	[AP_AMOUNT2] [float] NULL,
	[PAID_AMOUNT] [float] NULL,
	[PAID_AMOUNT2] [float] NULL,
	[OUSTANDING_AMOUNT] [float] NULL,
	[OUSTANDING_AMOUNT2] [float] NULL,
	[EXTRACT_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[LAST_ADJUSTED_AMT] [float] NULL,
	[LAST_ADJUSTED_DATE] [datetime] NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_AP_BALANCE_FINAL_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_AP_BALANCE_FINAL_F]
(
	[DATE_WID] [bigint] NULL,
	[BALANCE_WID] [bigint] NULL,
	[SUPPLIER_WID] [bigint] NULL,
	[ACCOUNT_WID] [bigint] NULL,
	[INV_RECID] [varchar](200) NULL,
	[INV_TRANSNO] [varchar](100) NULL,
	[SUPPLIER_CODE] [nvarchar](200) NULL,
	[INVOICE] [varchar](100) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[VENDOR_GROUP] [nvarchar](100) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[PAYMENT_TERM] [nvarchar](100) NULL,
	[PAYMENT_METHOD] [nvarchar](100) NULL,
	[DUE_DATE] [datetime] NULL,
	[INV_AP_AMOUNT] [float] NULL,
	[INV_AP_AMOUNT2] [float] NULL,
	[INV_PAID_AMOUNT] [float] NULL,
	[INV_PAID_AMOUNT2] [float] NULL,
	[INV_OUSTANDING_AMOUNT] [float] NULL,
	[INV_OUSTANDING_AMOUNT2] [float] NULL,
	[INV_LAST_ADJUSTED_AMT] [float] NULL,
	[LAST_ADJUSTED_DATE] [datetime] NULL,
	[TRANSNO] [varchar](100) NULL,
	[TRANSDATE] [datetime] NULL,
	[MEMO] [nvarchar](1000) NULL,
	[PM_RECID] [varchar](200) NULL,
	[TYPE] [int] NULL,
	[AP_AMOUNT] [float] NULL,
	[AP_AMOUNT2] [float] NULL,
	[TOTAL_AP_AMOUNT] [float] NULL,
	[TOTAL_AP_AMOUNT2] [float] NULL,
	[PAID_AMOUNT] [float] NULL,
	[PAID_AMOUNT2] [float] NULL,
	[TOTAL_PAID_AMOUNT] [float] NULL,
	[TOTAL_PAID_AMOUNT2] [float] NULL,
	[OPENING_AMOUNT] [float] NULL,
	[OPENING_AMOUNT2] [float] NULL,
	[OUSTANDING_AMOUNT] [float] NULL,
	[OUSTANDING_AMOUNT2] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_AP_PAYMENT_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_AP_PAYMENT_F]
(
	[DATE_WID] [bigint] NULL,
	[BALANCE_WID] [bigint] NULL,
	[SUPPLIER_WID] [bigint] NULL,
	[ACCOUNT_WID] [bigint] NULL,
	[RECID] [varchar](200) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[OBJECTID] [varchar](100) NULL,
	[TRANSDATE] [datetime] NULL,
	[TRANSNO] [varchar](100) NULL,
	[MEMO] [nvarchar](1000) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[SETTLEDID] [varchar](200) NULL,
	[SETTLEDAMT] [float] NULL,
	[SETTLEDAMT2] [float] NULL,
	[EXTRACT_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_AR_BALANCE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_AR_BALANCE_F]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[ACCOUNT_WID] [bigint] NULL,
	[RECID] [varchar](100) NULL,
	[CUSTOMER_CODE] [varchar](100) NULL,
	[INVOICE] [varchar](100) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[CUSTOMER_GROUP] [nvarchar](100) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[TRANSNO] [varchar](100) NULL,
	[TRANSDATE] [datetime] NULL,
	[PAYMENT_TERM] [nvarchar](100) NULL,
	[PAYMENT_METHOD] [nvarchar](100) NULL,
	[DUE_DATE] [datetime] NULL,
	[AR_AMOUNT] [float] NULL,
	[AR_AMOUNT2] [float] NULL,
	[PAID_AMOUNT] [float] NULL,
	[PAID_AMOUNT2] [float] NULL,
	[OUSTANDING_AMOUNT] [float] NULL,
	[OUSTANDING_AMOUNT2] [float] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[LAST_ADJUSTED_AMT] [float] NULL,
	[LAST_ADJUSTED_DATE] [datetime] NULL,
	[CREATED_DATE] [datetime] NULL,
	[EXTRACT_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_AR_BALANCE_F_BK]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_AR_BALANCE_F_BK]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[ACCOUNT_WID] [bigint] NULL,
	[RECID] [varchar](100) NULL,
	[CUSTOMER_CODE] [varchar](100) NULL,
	[INVOICE] [varchar](100) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[CUSTOMER_GROUP] [nvarchar](100) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[TRANSNO] [varchar](100) NULL,
	[TRANSDATE] [datetime] NULL,
	[PAYMENT_TERM] [nvarchar](100) NULL,
	[PAYMENT_METHOD] [nvarchar](100) NULL,
	[DUE_DATE] [datetime] NULL,
	[AR_AMOUNT] [float] NULL,
	[AR_AMOUNT2] [float] NULL,
	[PAID_AMOUNT] [float] NULL,
	[PAID_AMOUNT2] [float] NULL,
	[OUSTANDING_AMOUNT] [float] NULL,
	[OUSTANDING_AMOUNT2] [float] NULL,
	[EXTRACT_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_AR_BALANCE_FINAL_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_AR_BALANCE_FINAL_F]
(
	[DATE_WID] [bigint] NULL,
	[BALANCE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[ACCOUNT_WID] [bigint] NULL,
	[INV_RECID] [varchar](200) NULL,
	[INV_TRANSNO] [varchar](100) NULL,
	[CUSTOMER_CODE] [nvarchar](200) NULL,
	[INVOICE] [varchar](100) NULL,
	[INVOICE_DATE] [datetime] NULL,
	[CUSTOMER_GROUP] [nvarchar](100) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[PAYMENT_TERM] [nvarchar](100) NULL,
	[PAYMENT_METHOD] [nvarchar](100) NULL,
	[DUE_DATE] [datetime] NULL,
	[INV_AR_AMOUNT] [float] NULL,
	[INV_AR_AMOUNT2] [float] NULL,
	[INV_PAID_AMOUNT] [float] NULL,
	[INV_PAID_AMOUNT2] [float] NULL,
	[INV_OUSTANDING_AMOUNT] [float] NULL,
	[INV_OUSTANDING_AMOUNT2] [float] NULL,
	[INV_LAST_ADJUSTED_AMT] [float] NULL,
	[LAST_ADJUSTED_DATE] [datetime] NULL,
	[TRANSNO] [varchar](100) NULL,
	[TRANSDATE] [datetime] NULL,
	[MEMO] [nvarchar](1000) NULL,
	[PM_RECID] [varchar](200) NULL,
	[TYPE] [int] NULL,
	[AR_AMOUNT] [float] NULL,
	[AR_AMOUNT2] [float] NULL,
	[TOTAL_AR_AMOUNT] [float] NULL,
	[TOTAL_AR_AMOUNT2] [float] NULL,
	[PAID_AMOUNT] [float] NULL,
	[PAID_AMOUNT2] [float] NULL,
	[TOTAL_PAID_AMOUNT] [float] NULL,
	[TOTAL_PAID_AMOUNT2] [float] NULL,
	[OPENING_AMOUNT] [float] NULL,
	[OPENING_AMOUNT2] [float] NULL,
	[OUSTANDING_AMOUNT] [float] NULL,
	[OUSTANDING_AMOUNT2] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_AR_PAYMENT_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_AR_PAYMENT_F]
(
	[DATE_WID] [bigint] NULL,
	[BALANCE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[ACCOUNT_WID] [bigint] NULL,
	[RECID] [varchar](200) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[OBJECTID] [varchar](100) NULL,
	[TRANSDATE] [datetime] NULL,
	[TRANSNO] [varchar](100) NULL,
	[MEMO] [nvarchar](1000) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[SETTLEDID] [varchar](200) NULL,
	[SETTLEDAMT] [float] NULL,
	[SETTLEDAMT2] [float] NULL,
	[EXTRACT_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_AR_PAYMENT_F_BK]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_AR_PAYMENT_F_BK]
(
	[DATE_WID] [bigint] NULL,
	[BALANCE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[ACCOUNT_WID] [bigint] NULL,
	[RECID] [varchar](200) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[OBJECTID] [varchar](100) NULL,
	[TRANSDATE] [datetime] NULL,
	[TRANSNO] [varchar](100) NULL,
	[MEMO] [nvarchar](1000) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[SETTLEDID] [varchar](200) NULL,
	[SETTLEDAMT] [float] NULL,
	[SETTLEDAMT2] [float] NULL,
	[EXTRACT_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV1_NAME] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV2_NAME] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV3_NAME] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV4_NAME] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV5_NAME] [nvarchar](500) NULL,
	[ACCOUNTID] [nvarchar](1000) NULL,
	[OFFSETACCTID] [nvarchar](1000) NULL,
	[OBJECTID] [nvarchar](200) NULL,
	[MEMO] [nvarchar](500) NULL,
	[TYPE] [varchar](1) NULL,
	[SIGN] [varchar](1) NULL,
	[FORMULA] [nvarchar](500) NULL,
	[ISSHOW] [varchar](1) NULL,
	[MANUAL] [varchar](1) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_D_FORMULA]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_D_FORMULA]
(
	[ROW_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV1_NAME] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV2_NAME] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV3_NAME] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV4_NAME] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV5_NAME] [nvarchar](500) NULL,
	[ACCOUNTID] [nvarchar](200) NULL,
	[OFFSETACCTID] [nvarchar](200) NULL,
	[OBJECTID] [nvarchar](200) NULL,
	[MEMO] [nvarchar](500) NULL,
	[TYPE] [varchar](1) NULL,
	[SIGN] [varchar](1) NULL,
	[FORMULA] [nvarchar](500) NULL,
	[ISSHOW] [varchar](1) NULL,
	[MANUAL] [varchar](1) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL,
	[LINE_CODE] [nvarchar](100) NULL,
	[FORMULA_SIGN] [int] NULL,
	[LINE_LEVEL] [nvarchar](20) NULL,
	[CODE] [nvarchar](100) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_D_FORMULA_BK]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_D_FORMULA_BK]
(
	[ROW_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV1_NAME] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV2_NAME] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV3_NAME] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV4_NAME] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV5_NAME] [nvarchar](500) NULL,
	[ACCOUNTID] [nvarchar](200) NULL,
	[OFFSETACCTID] [nvarchar](200) NULL,
	[OBJECTID] [nvarchar](200) NULL,
	[MEMO] [nvarchar](500) NULL,
	[TYPE] [varchar](1) NULL,
	[SIGN] [varchar](1) NULL,
	[FORMULA] [nvarchar](500) NULL,
	[ISSHOW] [varchar](1) NULL,
	[MANUAL] [varchar](1) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL,
	[LINE_CODE] [nvarchar](100) NULL,
	[FORMULA_SIGN] [int] NULL,
	[LINE_LEVEL] [nvarchar](20) NULL,
	[CODE] [nvarchar](100) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_D_FORMULA0]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_D_FORMULA0]
(
	[ROW_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV1_NAME] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV2_NAME] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV3_NAME] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV4_NAME] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV5_NAME] [nvarchar](500) NULL,
	[ACCOUNTID] [nvarchar](1000) NULL,
	[OFFSETACCTID] [nvarchar](1000) NULL,
	[OBJECTID] [nvarchar](200) NULL,
	[MEMO] [nvarchar](500) NULL,
	[TYPE] [varchar](1) NULL,
	[SIGN] [varchar](1) NULL,
	[FORMULA] [nvarchar](500) NULL,
	[ISSHOW] [varchar](1) NULL,
	[MANUAL] [varchar](1) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL,
	[LINE_CODE] [nvarchar](100) NULL,
	[FORMULA_SIGN] [int] NULL,
	[LINE_LEVEL] [nvarchar](20) NULL,
	[CODE] [nvarchar](100) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_D_FORMULA1]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_D_FORMULA1]
(
	[ROW_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV1_NAME] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV2_NAME] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV3_NAME] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV4_NAME] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV5_NAME] [nvarchar](500) NULL,
	[ACCOUNTID] [nvarchar](1000) NULL,
	[OFFSETACCTID] [nvarchar](1000) NULL,
	[OBJECTID] [nvarchar](200) NULL,
	[MEMO] [nvarchar](500) NULL,
	[TYPE] [varchar](1) NULL,
	[SIGN] [varchar](1) NULL,
	[FORMULA] [nvarchar](500) NULL,
	[ISSHOW] [varchar](1) NULL,
	[MANUAL] [varchar](1) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL,
	[LINE_CODE] [nvarchar](100) NULL,
	[FORMULA_SIGN] [int] NULL,
	[LINE_LEVEL] [nvarchar](20) NULL,
	[CODE] [nvarchar](100) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_D_FORMULA2]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_D_FORMULA2]
(
	[ROW_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV1_NAME] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV2_NAME] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV3_NAME] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV4_NAME] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV5_NAME] [nvarchar](500) NULL,
	[ACCOUNTID] [nvarchar](200) NULL,
	[OFFSETACCTID] [nvarchar](200) NULL,
	[OBJECTID] [nvarchar](200) NULL,
	[MEMO] [nvarchar](500) NULL,
	[TYPE] [varchar](1) NULL,
	[SIGN] [varchar](1) NULL,
	[FORMULA] [nvarchar](500) NULL,
	[ISSHOW] [varchar](1) NULL,
	[MANUAL] [varchar](1) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL,
	[LINE_CODE] [nvarchar](100) NULL,
	[FORMULA_SIGN] [int] NULL,
	[LINE_LEVEL] [nvarchar](20) NULL,
	[CODE] [nvarchar](100) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_D_TEMP]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_D_TEMP]
(
	[ROW_WID] [bigint] NULL,
	[RN] [bigint] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_F]
(
	[DATE_WID] [bigint] NULL,
	[RL_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_F_TEMP]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_F_TEMP]
(
	[DATE_WID] [bigint] NULL,
	[RL_WID] [bigint] NULL,
	[AMT] [float] NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_MONTHLY_BALANCE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_MONTHLY_BALANCE_F]
(
	[DATE_WID] [bigint] NULL,
	[RL_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV0_CODE] [nvarchar](500) NULL,
	[OPENING] [float] NULL,
	[DR] [float] NULL,
	[CR] [float] NULL,
	[CLOSING] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_MONTHLY_FORECAST_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_MONTHLY_FORECAST_F]
(
	[DATE_WID] [bigint] NULL,
	[RL_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV0_CODE] [nvarchar](500) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_MONTHLY_FORECAST_F_TEMP]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_MONTHLY_FORECAST_F_TEMP]
(
	[DATE_WID] [bigint] NULL,
	[RL_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV0_CODE] [nvarchar](500) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_MONTHLY_FORECAST_F_TEMP01]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_MONTHLY_FORECAST_F_TEMP01]
(
	[DATE_WID] [bigint] NULL,
	[PO_ID] [bigint] NULL,
	[CUSTOMER_CODE] [nvarchar](200) NULL,
	[CONTRACT_TYPE_NAME] [nvarchar](200) NULL,
	[DATE] [datetime] NULL,
	[PAYMENT_SCHEDULE] [float] NULL,
	[PAYMENT_DATE] [datetime] NULL,
	[AMOUNT] [float] NULL,
	[PERCENTAGE] [float] NULL,
	[PAYMENT_AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_MONTHLY_FORECAST_F_TEMP02]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_MONTHLY_FORECAST_F_TEMP02]
(
	[TYPE] [bigint] NULL,
	[INVOICE] [nvarchar](100) NULL,
	[CUSTOMER_CODE] [nvarchar](200) NULL,
	[CONTRACT_TYPE_NAME] [nvarchar](200) NULL,
	[DATE] [bigint] NULL,
	[PAYMENT_DATE] [bigint] NULL,
	[PAYMENT_AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_MONTHLY_FORECAST_F_TMP2]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_MONTHLY_FORECAST_F_TMP2]
(
	[DATE_WID] [bigint] NULL,
	[RL_WID] [bigint] NULL,
	[STT] [bigint] NULL,
	[REPORT_VIEW] [int] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV4_CODE] [nvarchar](500) NULL,
	[LV5_CODE] [nvarchar](500) NULL,
	[LV0_CODE] [nvarchar](500) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_MONTHLY_PLAN_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_MONTHLY_PLAN_F]
(
	[DATE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[CUSTOMER_CODE] [varchar](200) NULL,
	[PAYMENT_TERM_WID] [bigint] NULL,
	[PAYMENT_DATE] [datetime] NULL,
	[PRICE_FOB] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_WEEKLY_BANK_DISCOUNT_RATE_CONFIG_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_WEEKLY_BANK_DISCOUNT_RATE_CONFIG_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[BANK] [nvarchar](200) NULL,
	[WEEK_WID] [varchar](10) NULL,
	[RATE] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_WEEKLY_PLAN_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_WEEKLY_PLAN_F]
(
	[DATE_WID] [bigint] NULL,
	[WEEKLY_REPORTING_LINE_KEY] [bigint] NULL,
	[WEEK_WID] [varchar](10) NULL,
	[NO] [nvarchar](50) NULL,
	[STT] [bigint] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[AMT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CF_WEEKLY_REPORTING_LINE_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CF_WEEKLY_REPORTING_LINE_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[STT] [bigint] NULL,
	[LV1_CODE] [nvarchar](500) NULL,
	[LV1_NAME] [nvarchar](500) NULL,
	[LV2_CODE] [nvarchar](500) NULL,
	[LV2_NAME] [nvarchar](500) NULL,
	[LV3_CODE] [nvarchar](500) NULL,
	[LV3_NAME] [nvarchar](500) NULL,
	[FORMULA] [nvarchar](500) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_CUSTOMER_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_CUSTOMER_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_CODE] [nvarchar](100) NULL,
	[CUSTOMER_NAME] [nvarchar](500) NULL,
	[CUSTOMER_GROUP] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_GL_ACCOUNT_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_GL_ACCOUNT_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[ACCOUNT_CODE] [varchar](200) NULL,
	[ACCOUNT_NAME] [nvarchar](500) NULL,
	[ACCOUNT_DESCRIPTION] [nvarchar](500) NULL,
	[ACCOUNT_TYPE] [nvarchar](200) NULL,
	[PARENT_ACCOUNT] [varchar](200) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_GL_BALANCE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_GL_BALANCE_F]
(
	[DATE_WID] [bigint] NULL,
	[ACCOUNTID] [varchar](200) NULL,
	[OFFSETACCTID] [varchar](200) NULL,
	[OBJECTID] [varchar](200) NULL,
	[DR] [float] NULL,
	[DR2] [float] NULL,
	[CR] [float] NULL,
	[CR2] [float] NULL,
	[OPENING] [float] NULL,
	[OPENING2] [float] NULL,
	[CLOSING] [float] NULL,
	[CLOSING2] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_GL_DATA_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_GL_DATA_F]
(
	[DATE_WID] [bigint] NULL,
	[RECID] [varchar](200) NULL,
	[ACCOUNTID] [varchar](100) NULL,
	[POSTEDON] [datetime] NULL,
	[TRANSDATE] [datetime] NULL,
	[TRANSTYPE] [varchar](100) NULL,
	[TRANSNO] [varchar](200) NULL,
	[MEMO] [nvarchar](1000) NULL,
	[CURRENCYID] [varchar](20) NULL,
	[EXCHANGERATE] [float] NULL,
	[CREDITING] [bit] NULL,
	[OFFSETACCTID] [varchar](100) NULL,
	[DIM1] [varchar](200) NULL,
	[DIM2] [varchar](200) NULL,
	[DIM3] [varchar](200) NULL,
	[TRANSAMT] [float] NULL,
	[TRANSAMT2] [float] NULL,
	[OBJECTID] [varchar](100) NULL,
	[OBJECTTYPE] [varchar](20) NULL,
	[PROJECTID] [varchar](100) NULL,
	[OBJECTNAME] [nvarchar](100) NULL,
	[SOURCE] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_LAC_SUPPLIER_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_LAC_SUPPLIER_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[SUPPLIER_CODE] [nvarchar](100) NULL,
	[SUPPLIER_NAME] [nvarchar](500) NULL,
	[SUPPLIER_GROUP] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MDK_AMAZON_SALE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MDK_AMAZON_SALE_F]
(
	[DATE_WID] [bigint] NULL,
	[CHANNEL_WID] [bigint] NULL,
	[VARIANT_WID] [bigint] NULL,
	[STORE_CODE] [bigint] NULL,
	[STORE_NAME] [nvarchar](500) NULL,
	[POSTED_DATE] [datetime] NULL,
	[PERIOD] [varchar](200) NULL,
	[ORDER_ID] [nvarchar](200) NULL,
	[SKU_AMZ] [nvarchar](200) NULL,
	[SKU_MDK] [nvarchar](200) NULL,
	[AMT] [float] NULL,
	[QTY] [int] NULL,
	[POS_HRV] [nvarchar](200) NULL,
	[REFUND_QTY] [int] NULL,
	[REFUND_AMT] [float] NULL,
	[ACT_QTY] [int] NULL,
	[ACT_AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MDK_AOP_SALE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MDK_AOP_SALE_F]
(
	[DATE_WID] [bigint] NULL,
	[CHANNEL_WID] [bigint] NULL,
	[STORE_CODE] [varchar](100) NULL,
	[STORE_NAME] [nvarchar](500) NULL,
	[UOM] [varchar](50) NULL,
	[QUANTITY] [int] NULL,
	[CURRENCY] [varchar](50) NULL,
	[AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MDK_COOP_SALE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MDK_COOP_SALE_F]
(
	[DATE_WID] [bigint] NULL,
	[CHANNEL_WID] [bigint] NULL,
	[STORE_CODE] [varchar](100) NULL,
	[STORE_NAME] [nvarchar](500) NULL,
	[QUANTITY] [int] NULL,
	[AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MDK_PAYMENT_METHOD_MAPPING_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MDK_PAYMENT_METHOD_MAPPING_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[PAYMENT_GROUP] [nvarchar](200) NULL,
	[PAYMENT_METHOD] [nvarchar](200) NULL,
	[PAYMENT_NAME] [nvarchar](200) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MDK_PRODUCT_MAPPING_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MDK_PRODUCT_MAPPING_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[VERSION_CODE] [varchar](200) NULL,
	[BARCODE] [varchar](200) NULL,
	[PARENT_SKUS] [varchar](200) NULL,
	[SEASON] [varchar](20) NULL,
	[YEAR] [int] NULL,
	[LINE] [nvarchar](20) NULL,
	[STYLE] [nvarchar](50) NULL,
	[GENDER] [nvarchar](20) NULL,
	[TYPE] [nvarchar](200) NULL,
	[CATEGORY] [nvarchar](100) NULL,
	[SUBCATE] [nvarchar](200) NULL,
	[MATERIAL] [nvarchar](200) NULL,
	[SIZE] [nvarchar](50) NULL,
	[COLOR_NAME] [nvarchar](200) NULL,
	[COLOR_CODE] [nvarchar](200) NULL,
	[COLORGROUP] [nvarchar](200) NULL,
	[SIHOUETTE] [nvarchar](200) NULL,
	[ORG_PRICE] [float] NULL,
	[SELLING_PRICE] [float] NULL,
	[SELLING_PRICE_FROMDATE] [datetime] NULL,
	[BRAND] [nvarchar](50) NULL,
	[NOTE] [nvarchar](500) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MDK_SALE_TARGET_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MDK_SALE_TARGET_F]
(
	[DATE_WID] [bigint] NULL,
	[CHANNEL_WID] [bigint] NULL,
	[STORE_CODE] [varchar](100) NULL,
	[STORE_NAME] [nvarchar](500) NULL,
	[UOM] [varchar](50) NULL,
	[QUANTITY] [int] NULL,
	[CURRENCY] [varchar](50) NULL,
	[AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MDK_STORE_GFA_STAFF_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MDK_STORE_GFA_STAFF_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CHANNEL_WID] [bigint] NULL,
	[STORE_CODE] [nvarchar](200) NULL,
	[STORE_NAME] [nvarchar](500) NULL,
	[GFA_M2] [float] NULL,
	[NUM_OF_STAFF] [int] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](1000) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MDK_SUBCHANNEL_MAPPING_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MDK_SUBCHANNEL_MAPPING_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[HARAVAN_STORENAME] [nvarchar](200) NULL,
	[STORENAME] [nvarchar](200) NULL,
	[SUBCHANNEL] [nvarchar](200) NULL,
	[CHANNEL] [nvarchar](200) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_CONTRACT_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_CONTRACT_F]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[PAYMENT_TERM_WID] [bigint] NULL,
	[CONTRACT_ID] [bigint] NULL,
	[CONTRACT_NUMBER] [nvarchar](200) NULL,
	[CUSTOMER_CODE] [varchar](200) NULL,
	[SIGNED_DATE] [datetime] NULL,
	[PAYMENT_TERM_CODE] [varchar](100) NULL,
	[SALESMAN_CODE] [nvarchar](200) NULL,
	[DELIVERY_TYPE] [nvarchar](100) NULL,
	[DELIVERY_REGISTER] [nvarchar](100) NULL,
	[START_CONTRACT_DATE] [datetime] NULL,
	[COMPLETE_CONTRACT_DATE] [datetime] NULL,
	[CONTACT_PERSON] [nvarchar](100) NULL,
	[CONTRACT_TYPE_CODE] [varchar](100) NULL,
	[CONTRACT_TYPE_NAME] [nvarchar](200) NULL,
	[CONTRACT_TYPE_GROUP] [varchar](50) NULL,
	[CONTRACT_PARENT_TYPE_GROUP] [nvarchar](200) NULL,
	[PRODUCTION_TYPE] [varchar](50) NULL,
	[CURENCY] [varchar](50) NULL,
	[EXCHANGE_RATE] [float] NULL,
	[QUANTITY] [int] NULL,
	[DOCUMENT_AMOUNT] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[PO_ID] [bigint] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_CUSTOMER_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_CUSTOMER_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_CODE] [varchar](200) NULL,
	[CUSTOMER_NAME] [nvarchar](500) NULL,
	[GROUP] [nvarchar](100) NULL,
	[PHONE] [nvarchar](100) NULL,
	[FAX] [nvarchar](100) NULL,
	[EMAIL] [nvarchar](100) NULL,
	[BRAND] [nvarchar](100) NULL,
	[REPRESENTATIVE] [nvarchar](100) NULL,
	[PERSON_CONTACT] [nvarchar](100) NULL,
	[CUSTOMER_TYPE] [nvarchar](100) NULL,
	[ADDRESS1] [nvarchar](1000) NULL,
	[ADDRESS2] [nvarchar](1000) NULL,
	[COUNTRY] [nvarchar](100) NULL,
	[CUSTOMER_CREATED_DATE] [datetime] NULL,
	[STATUS] [varchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_DEPARTMENT_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_DEPARTMENT_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[FACTORY_WID] [bigint] NULL,
	[DEPARTMENT_CODE] [nvarchar](100) NULL,
	[DEPARTMENT_NAME] [nvarchar](200) NULL,
	[LACVIET_CODE] [nvarchar](100) NULL,
	[DESCRIPTION] [nvarchar](100) NULL,
	[FACTORY_CODE] [nvarchar](100) NULL,
	[IS_LINE] [bit] NULL,
	[IS_PLAN] [bit] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_EXCHANGE_RATE_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_EXCHANGE_RATE_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[FROMDATE] [datetime] NULL,
	[CURRENCY] [nvarchar](20) NULL,
	[EXCHANGE_RATE] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_FACTORY_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_FACTORY_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[FACTORY_CODE] [varchar](100) NULL,
	[FACTORY_TYPE] [varchar](10) NULL,
	[FACTORY_SHORT_NAME] [nvarchar](200) NULL,
	[FACTORY_NAME] [nvarchar](500) NULL,
	[FACTORY_ADDRESS1] [nvarchar](1000) NULL,
	[FACTORY_ADDRESS2] [nvarchar](1000) NULL,
	[FACTORY_PHONE] [varchar](100) NULL,
	[COMPANY_CODE] [varchar](100) NULL,
	[COMPANY_NAME] [nvarchar](200) NULL,
	[COMPANY_ADDRESS] [nvarchar](500) NULL,
	[COMPANY_EMAIL] [varchar](100) NULL,
	[COMPANY_FAX] [varchar](100) NULL,
	[GROUP] [nvarchar](100) NULL,
	[COUNTRY] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_FORMULA_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_FORMULA_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[FORMULA_CODE] [nvarchar](100) NULL,
	[WAREHOUSE_CODE] [nvarchar](100) NULL,
	[PRODUCTION_STAGE_CODE] [nvarchar](100) NULL,
	[PURPOSE_IMEX_CODE] [nvarchar](100) NULL,
	[IMEX_TYPE] [varchar](20) NULL,
	[SIGN] [varchar](20) NULL,
	[SOURCE] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_INSPECTION_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_INSPECTION_D]
(
	[INSPECTION_FLAG] [varchar](20) NULL,
	[W_INSERT_DT] [datetime] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_PAYMENT_TERM_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_PAYMENT_TERM_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[PAYMENT_TERM_CODE] [varchar](100) NULL,
	[PAYMENT_TERM_NAME] [nvarchar](200) NULL,
	[DESCRIPTION] [varchar](100) NULL,
	[NUMBER_OF_PAYMENT] [int] NULL,
	[PAYMENT_SCHEDULE_1ST] [int] NULL,
	[PAYMENT_SCHEDULE_2ND] [int] NULL,
	[PAYMENT_SCHEDULE_3RD] [int] NULL,
	[PAYMENT_SCHEDULE_4TH] [int] NULL,
	[PAYMENT_SCHEDULE_5TH] [int] NULL,
	[PERCENTAGE_OF_PS_1ST] [float] NULL,
	[PERCENTAGE_OF_PS_2ND] [float] NULL,
	[PERCENTAGE_OF_PS_3RD] [float] NULL,
	[PERCENTAGE_OF_PS_4TH] [float] NULL,
	[PERCENTAGE_OF_PS_5TH] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_PAYMENT_TYPE_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_PAYMENT_TYPE_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CREATED_DATE] [datetime] NULL,
	[PAYMENT_TYPE] [nvarchar](100) NULL,
	[CUSTUMER_CODE] [nvarchar](200) NULL,
	[PAYMENT_CODE] [nvarchar](100) NULL,
	[SOURCE] [nvarchar](50) NULL,
	[BANK_CODE] [nvarchar](100) NULL,
	[EFFECTIVE_DATE] [datetime] NULL,
	[FROM] [bigint] NULL,
	[TO] [bigint] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_PROCESSING_PRICE_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_PROCESSING_PRICE_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[ITEM_WID] [bigint] NULL,
	[ITEM_ID] [bigint] NULL,
	[COLOR] [varchar](50) NULL,
	[SIZE] [varchar](50) NULL,
	[PRICE_CM_2] [float] NULL,
	[PRICE_P_2] [float] NULL,
	[PRICE_T_2] [float] NULL,
	[PRICE_W_2] [float] NULL,
	[PRICE_E_2] [float] NULL,
	[PRICE_IN_2] [float] NULL,
	[PRICE_OTHER_2] [float] NULL,
	[PRICE_TOTAL_2] [float] NULL,
	[PRICE_CM_3] [float] NULL,
	[PRICE_P_3] [float] NULL,
	[PRICE_T_3] [float] NULL,
	[PRICE_W3] [float] NULL,
	[PRICE_E_3] [float] NULL,
	[PRICE_IN_3] [float] NULL,
	[PRICE_OTHER_3] [float] NULL,
	[PRICE_TOTAL_3] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_PRODUCT_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_PRODUCT_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[ITEM_ID] [bigint] NULL,
	[ITEM_CODE] [varchar](100) NULL,
	[COLOR_CODE] [nvarchar](100) NULL,
	[SIZE] [nvarchar](100) NULL,
	[ITEM_NAME_VN] [nvarchar](500) NULL,
	[ITEM_NAME_EN] [varchar](500) NULL,
	[ITEM_NAME_EX] [nvarchar](500) NULL,
	[DESCRIPTION] [nvarchar](500) NULL,
	[ITEM_MODEL] [varchar](50) NULL,
	[SUBCATEGORY_CODE] [varchar](100) NULL,
	[SUBCATEGORY_NAME] [nvarchar](500) NULL,
	[SUBCATEGORY_NAME_EN] [varchar](500) NULL,
	[CATEGORY_CODE] [varchar](100) NULL,
	[CATEGORY_NAME] [nvarchar](100) NULL,
	[CATEGORY_GROUP] [nvarchar](100) NULL,
	[CLASS] [nvarchar](100) NULL,
	[FACTORY_CODE] [nvarchar](100) NULL,
	[GENDER] [nvarchar](20) NULL,
	[CUSTOMER_CODE] [varchar](100) NULL,
	[RECEIVE_CUSTOMER_CODE] [varchar](100) NULL,
	[PAYMENT_CUSTOMER_CODE] [varchar](100) NULL,
	[CONTRACT_ID] [bigint] NULL,
	[UOM] [nvarchar](50) NULL,
	[ITEM_ID_REF] [bigint] NULL,
	[STATUS] [varchar](20) NULL,
	[IMAGE_URL] [nvarchar](200) NULL,
	[PRICE_FOB] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_PRODUCT_FACTORRY_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_PRODUCT_FACTORRY_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[ITEM_ID] [bigint] NULL,
	[ITEM_CODE] [varchar](100) NULL,
	[COLOR_CODE] [nvarchar](100) NULL,
	[SIZE] [nvarchar](100) NULL,
	[ITEM_NAME_VN] [nvarchar](500) NULL,
	[ITEM_NAME_EN] [varchar](500) NULL,
	[ITEM_NAME_EX] [nvarchar](500) NULL,
	[DESCRIPTION] [nvarchar](500) NULL,
	[ITEM_MODEL] [varchar](50) NULL,
	[SUBCATEGORY_CODE] [varchar](100) NULL,
	[SUBCATEGORY_NAME] [nvarchar](500) NULL,
	[SUBCATEGORY_NAME_EN] [varchar](500) NULL,
	[CATEGORY_CODE] [varchar](100) NULL,
	[CATEGORY_NAME] [nvarchar](100) NULL,
	[CATEGORY_GROUP] [nvarchar](100) NULL,
	[CLASS] [nvarchar](100) NULL,
	[FACTORY_CODE] [nvarchar](100) NULL,
	[GENDER] [nvarchar](20) NULL,
	[CUSTOMER_CODE] [varchar](100) NULL,
	[RECEIVE_CUSTOMER_CODE] [varchar](100) NULL,
	[PAYMENT_CUSTOMER_CODE] [varchar](100) NULL,
	[CONTRACT_ID] [bigint] NULL,
	[UOM] [nvarchar](50) NULL,
	[ITEM_ID_REF] [bigint] NULL,
	[STATUS] [varchar](20) NULL,
	[IMAGE_URL] [nvarchar](200) NULL,
	[PRICE_FOB] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_PRODUCTION_STAGE_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_PRODUCTION_STAGE_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[PRODUCTION_STAGE_CODE] [varchar](100) NULL,
	[PRODUCTION_STAGE_NAME] [nvarchar](200) NULL,
	[DESCRIPTION] [nvarchar](500) NULL,
	[SOURCE] [varchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_PURPOSE_IMEX_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_PURPOSE_IMEX_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[PURPOSE_IMEX_CODE] [varchar](200) NULL,
	[PURPOSE_IMEX_NAME] [nvarchar](500) NULL,
	[TYPE] [varchar](10) NULL,
	[IS_TRANFER_ITEM] [varchar](10) NULL,
	[IS_TRANFER_STORE] [varchar](10) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_SALE_JOURNAL_DATE_REPORT_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_SALE_JOURNAL_DATE_REPORT_D]
(
	[DATE_WID] [bigint] NULL,
	[DATE] [datetime] NULL,
	[SOURCE] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_MD_WAREHOUSE_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_MD_WAREHOUSE_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[FACTORY_WID] [bigint] NULL,
	[WAREHOUSE_CODE] [varchar](100) NULL,
	[WAREHOUSE_NAME] [nvarchar](500) NULL,
	[ADDRESS] [nvarchar](1000) NULL,
	[FACTORY_CODE] [varchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_PRODUCTION_CALENDAR_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_PRODUCTION_CALENDAR_D]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE_ID] [bigint] NULL,
	[DAY] [datetime] NULL,
	[CALENDAR_TYPE] [nvarchar](100) NULL,
	[WORKING_HOUR] [float] NULL,
	[HOLIDAY_NAME] [nvarchar](200) NULL,
	[DEPARTMENT] [nvarchar](100) NULL,
	[COMPANY] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TGT_FACTORY_TAGRET_MONTH_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TGT_FACTORY_TAGRET_MONTH_F]
(
	[DATE_WID] [bigint] NULL,
	[PRODUCTION_DATE_WID] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[DEPARTMENT_WID] [bigint] NULL,
	[PRODUCTION_STAGE_WID] [bigint] NULL,
	[FACTORY_CODE] [nvarchar](200) NULL,
	[DATE] [datetime] NULL,
	[ITEM_ID] [nvarchar](200) NULL,
	[PRODUCTION_STAGE_CODE] [nvarchar](100) NULL,
	[DEPARTMENT_CODE] [nvarchar](100) NULL,
	[PLAN_QUANTITY] [int] NULL,
	[PRICE_CM] [float] NULL,
	[PRICE_P] [float] NULL,
	[PRICE_T] [float] NULL,
	[PRICE_W] [float] NULL,
	[PRICE_E] [float] NULL,
	[PRICE_PRINT] [float] NULL,
	[PRICE_OTHER] [float] NULL,
	[TYPE] [nvarchar](100) NULL,
	[SOURCE] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TGT_PRODUCTION_TARGET_DAY_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TGT_PRODUCTION_TARGET_DAY_F]
(
	[DATE_WID] [bigint] NULL,
	[PRODUCTION_DATE_WID] [bigint] NULL,
	[DEPARTMENT_WID] [bigint] NULL,
	[EMPLOYEE_TYPE] [nvarchar](100) NULL,
	[DEPARTMENT_CODE] [varchar](100) NULL,
	[DATE] [datetime] NULL,
	[MAKING_EMPLOYEE_COUNT] [int] NULL,
	[ASSISTANT_EMPLOYEE_COUNT] [int] NULL,
	[LINE_LEADER_COUNT] [int] NULL,
	[ORTHER_EMPLOYEE_COUNT] [int] NULL,
	[ABSENT_COUNT] [int] NULL,
	[PRESENT_COUNT] [int] NULL,
	[WORK_DAY] [float] NULL,
	[OT] [float] NULL,
	[MAKING_EMPLOYEE_PRESENT] [int] NULL,
	[ASSISTANT_EMPLOYEE_PRESENT] [int] NULL,
	[WORD_DAY_OF_MAKING] [float] NULL,
	[WORD_DAY_OF_ASSISTANT] [float] NULL,
	[OT_OF_MAKING] [float] NULL,
	[OT_OF_ASSISTANT] [float] NULL,
	[FACTORY_CODE] [varchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TGT_PRODUCTION_TARGET_MONTH_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TGT_PRODUCTION_TARGET_MONTH_F]
(
	[DATE_WID] [bigint] NULL,
	[PRODUCTION_DATE_WID] [bigint] NULL,
	[DEPARTMENT_WID] [bigint] NULL,
	[DATE] [datetime] NULL,
	[DEPARTMENT_CODE] [varchar](100) NULL,
	[FACTORY_CODE] [varchar](100) NULL,
	[BEP_AMOUNT] [float] NULL,
	[TOTAL_SALARY_] [float] NULL,
	[EXTRA_TIME] [float] NULL,
	[WORKING_TIME_8H] [float] NULL,
	[SALARY_ALLOWANCE] [float] NULL,
	[COSTING_WORKING_DAY] [float] NULL,
	[EXTRA_AMOUNT_X] [float] NULL,
	[EXTRA_AMOUNT] [float] NULL,
	[AMOUNT_8H] [float] NULL,
	[AMOUNT_9H] [float] NULL,
	[AMOUNT_9H_X] [float] NULL,
	[AMOUNT_PER_DEPARTMENT] [float] NULL,
	[AMOUNT_PER_DAY] [float] NULL,
	[AMOUNT_PER_MONTH] [float] NULL,
	[NUMBER_OF_DAY] [float] NULL,
	[NUMBER_OF_WORKER] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TGT_SALES_YEAR_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TGT_SALES_YEAR_F]
(
	[DATE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[DEPARTMENT_WID] [bigint] NULL,
	[FACTORY_CODE] [nvarchar](100) NULL,
	[TARGET_CODE] [nvarchar](100) NULL,
	[TYPE] [nvarchar](100) NULL,
	[YEAR] [varchar](4) NULL,
	[CUSTOMER_CODE] [nvarchar](100) NULL,
	[DEPARTMENT_CODE] [nvarchar](100) NULL,
	[CURRENCY] [nvarchar](20) NULL,
	[CONTRACT_TYPE] [nvarchar](50) NULL,
	[ROW_CODE] [nvarchar](100) NULL,
	[DESCRIPTION] [nvarchar](200) NULL,
	[MONTH] [varchar](2) NULL,
	[QUANTITY] [float] NULL,
	[AMOUNT] [float] NULL,
	[SUM_OF_QUANTITY] [float] NULL,
	[SUM_OF_AMOUNT] [float] NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_FACTORY_QUANTITY_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_FACTORY_QUANTITY_F]
(
	[FACTORY_WID] [bigint] NULL,
	[PRODUCTION_STAGE_WID] [bigint] NULL,
	[FACTORY_CODE] [nvarchar](200) NULL,
	[PO_ID] [bigint] NULL,
	[PLAN_QUANTITY] [float] NULL,
	[PO_PACKING_QUANTITY_PCS] [float] NULL,
	[PRODUCTION_STAGE_CODE] [nvarchar](200) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [nvarchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_INVENTORY_PRODUCT_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_INVENTORY_PRODUCT_F]
(
	[DATE_WID] [bigint] NULL,
	[DEPARTMENT_WID] [bigint] NULL,
	[WAREHOUSE_WID] [bigint] NULL,
	[PURPOSE_IMEX_WID] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[FACTORY_CODE] [nvarchar](100) NULL,
	[VOUCHER_NO] [nvarchar](100) NULL,
	[VOUCHER_DATE] [datetime] NULL,
	[WAREHOUSE_CODE] [nvarchar](100) NULL,
	[PURPOSE_IMEX_CODE] [nvarchar](100) NULL,
	[IMEX_TYPE] [varchar](20) NULL,
	[OBJECT_CODE] [nvarchar](100) NULL,
	[ITEM_ID] [bigint] NULL,
	[PO_ID] [bigint] NULL,
	[COLOR_CODE] [nvarchar](100) NULL,
	[SIZE] [nvarchar](100) NULL,
	[QUANTITY] [int] NULL,
	[FORMULA_CODE] [nvarchar](100) NULL,
	[SIGN] [varchar](20) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_PRODUCTION_ACTUAL_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_PRODUCTION_ACTUAL_F]
(
	[DATE_WID] [bigint] NULL,
	[PRODUCTION_DATE_WID] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[PROCESSING_PRICE_WID] [bigint] NULL,
	[DEPARTMENT_WID] [bigint] NULL,
	[PRODUCTION_STAGE_WID] [bigint] NULL,
	[CONTRACT_WID] [bigint] NULL,
	[PRODUCTION_DATE] [datetime] NULL,
	[BATCH_NO] [int] NULL,
	[CREATED_DATE] [datetime] NULL,
	[ITEM_ID] [bigint] NULL,
	[COLOR_CODE] [varchar](50) NULL,
	[SIZE] [varchar](50) NULL,
	[PO_ID] [bigint] NULL,
	[PO_SOURCE] [varchar](3) NULL,
	[DEPARTMENT_CODE] [varchar](50) NULL,
	[PRODUCTION_STAGE_CODE] [varchar](50) NULL,
	[FACTORY_CODE] [varchar](50) NULL,
	[QUANTITY] [int] NULL,
	[FOB_PRICE] [float] NULL,
	[TABLE_NO] [varchar](50) NULL,
	[LOT_NO] [varchar](50) NULL,
	[LAYERS_QUANTITY] [int] NULL,
	[ITEM_NO] [nvarchar](50) NULL,
	[CARTON_QUANTITY] [int] NULL,
	[PO_FACTORY] [bit] NULL,
	[SOURCE] [varchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_PRODUCTION_PLAN_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_PRODUCTION_PLAN_F]
(
	[DATE_WID] [bigint] NULL,
	[PRODUCTION_DATE_WID] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[DEPARTMENT_WID] [bigint] NULL,
	[ITEM_ID] [bigint] NULL,
	[FACTORY_CODE] [nvarchar](100) NULL,
	[LINE] [nvarchar](100) NULL,
	[DAY] [datetime] NULL,
	[PLAN_QUANTITY] [int] NULL,
	[ACTUAL_QUANTITY] [int] NULL,
	[CATEGORY_GROUP] [nvarchar](200) NULL,
	[ITEM_FACTORY] [bit] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_PURCHASE_ORDER_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_PURCHASE_ORDER_F]
(
	[DATE_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[CREATED_DATE] [datetime] NULL,
	[CLOSED] [bit] NULL,
	[ITEM_NAME] [nvarchar](500) NULL,
	[TERMS_OF_PURCHASE] [nvarchar](200) NULL,
	[PAYMENT_TERM] [nvarchar](200) NULL,
	[PRICE] [float] NULL,
	[PURCHASEUNIT] [nvarchar](50) NULL,
	[UNIT] [nvarchar](50) NULL,
	[PAYMENT_TIME] [float] NULL,
	[CONVERSION_FACTOR] [float] NULL,
	[PAYMENT_METHOD] [nvarchar](100) NULL,
	[LINE_ID] [bigint] NULL,
	[IN_STOCK] [bit] NULL,
	[PAYMENT_TYPE] [nvarchar](200) NULL,
	[VOUCHER_TYPE] [nvarchar](200) NULL,
	[PLACE_OF_PURCHASE] [nvarchar](50) NULL,
	[CURRENCY] [nvarchar](50) NULL,
	[SUPPLIER_CODE] [nvarchar](200) NULL,
	[ITEM_CODE] [nvarchar](200) NULL,
	[ITEM_ID] [bigint] NULL,
	[COLOR_CODE] [nvarchar](200) NULL,
	[SOURCE] [nvarchar](100) NULL,
	[PREPAYME_DATE] [datetime] NULL,
	[DUE_DATE] [datetime] NULL,
	[VOUCHER_DATE] [datetime] NULL,
	[PURCHASE_QUANTITY] [float] NULL,
	[WAREHOUSE_QUANTITY] [float] NULL,
	[VOUCHER_NO] [nvarchar](200) NULL,
	[PREPAYMENT_AMOUNT] [float] NULL,
	[AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_SALES_INVOICE_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_SALES_INVOICE_F]
(
	[DATE_WID] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[CONTRACT_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[FACTORY_WID] [bigint] NULL,
	[PAYMENT_TERM_WID] [bigint] NULL,
	[INVOICE_NUMBER] [varchar](200) NULL,
	[INVOICE_LINE] [bigint] NULL,
	[VOUCHER_DATE] [datetime] NULL,
	[INVOICE_DATE] [datetime] NULL,
	[SHIP_RUN_DATE] [datetime] NULL,
	[BILL_DATE] [datetime] NULL,
	[COUNTRY_DESTINATION] [nvarchar](100) NULL,
	[PORT_DESTINATION] [nvarchar](100) NULL,
	[TRANSPORT_TYPE] [nvarchar](30) NULL,
	[PO_ID] [bigint] NULL,
	[ITEM_ID] [bigint] NULL,
	[CUSTOMER_CODE] [nvarchar](100) NULL,
	[RECEIVE_CUSTOMER_CODE] [nvarchar](100) NULL,
	[PAYMENT_CUSTOMER_CODE] [nvarchar](100) NULL,
	[PRICE_TYPE] [nvarchar](30) NULL,
	[PAYMENT_TERM] [nvarchar](30) NULL,
	[PAYMENT_METHOD] [nvarchar](30) NULL,
	[FACTORY_CODE] [nvarchar](30) NULL,
	[INVOICE_STATUS] [nvarchar](50) NULL,
	[COLOR_CODE] [nvarchar](30) NULL,
	[SIZE] [nvarchar](30) NULL,
	[UOM] [nvarchar](30) NULL,
	[CURRENCY] [nvarchar](30) NULL,
	[PRICE_CONTRACT] [float] NULL,
	[DISCOUNT_PERCENT] [float] NULL,
	[PRICE_FOB] [float] NULL,
	[PRICE_PROCESSING] [float] NULL,
	[PRICE_CM] [float] NULL,
	[PRICE_P] [float] NULL,
	[PRICE_T] [float] NULL,
	[PRICE_W] [float] NULL,
	[PRICE_E] [float] NULL,
	[PRICE_PRINT] [float] NULL,
	[PRICE_OTHER] [float] NULL,
	[CLEARANCE_DECLARATION_STYLE] [nvarchar](50) NULL,
	[QUANTITY] [int] NULL,
	[DOCUMENT_AMOUNT] [float] NULL,
	[INVOICE_NUMBER_REF] [varchar](200) NULL,
	[INVOICE_DATE_REF] [varchar](100) NULL,
	[LC_NO] [varchar](100) NULL,
	[BILL_NO] [varchar](100) NULL,
	[INSPECTION] [varchar](10) NULL,
	[GATE] [nvarchar](200) NULL,
	[EXCHANGE_RATE] [float] NULL,
	[QUOTA] [varchar](10) NULL,
	[TERMS_OF_DELIVERY] [varchar](50) NULL,
	[CARTON_QUANTITY] [int] NULL,
	[NET_WEIGHT] [float] NULL,
	[GROSS_WEIGHT] [float] NULL,
	[MEAS] [float] NULL,
	[BAG_QUANTITY] [int] NULL,
	[BANK_DISCOUNT] [nvarchar](200) NULL,
	[ESTIMATED_DATE_OF_DISCOUNT] [datetime] NULL,
	[ETD] [datetime] NULL,
	[ESTIMATED_DISCOUNT_FEE] [float] NULL,
	[BANKING_FEE] [float] NULL,
	[ESTIMATED_DISCOUNT_AMOUNT] [float] NULL,
	[AMOUNT_DUE] [float] NULL,
	[ESTIMATED_AMOUNT_DUE] [float] NULL,
	[ESTIMATED_DISCOUNT_PERCENT] [float] NULL,
	[DISCOUNT_STATUS] [nvarchar](200) NULL,
	[DUE_DATE] [datetime] NULL,
	[DISCOUNT_DATE] [datetime] NULL,
	[DISCOUNT_AMOUNT] [float] NULL,
	[DISCOUNT_RATE] [float] NULL,
	[RECEIPT_DATE] [datetime] NULL,
	[RECEIPT_BANK] [nvarchar](200) NULL,
	[RECEIPT_NO] [nvarchar](200) NULL,
	[SOURCE] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_SALES_INVOICE_F_bk]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_SALES_INVOICE_F_bk]
(
	[DATE_WID] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[CONTRACT_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[FACTORY_WID] [bigint] NULL,
	[PAYMENT_TERM_WID] [bigint] NULL,
	[INVOICE_NUMBER] [varchar](200) NULL,
	[INVOICE_LINE] [bigint] NULL,
	[VOUCHER_DATE] [datetime] NULL,
	[INVOICE_DATE] [datetime] NULL,
	[SHIP_RUN_DATE] [datetime] NULL,
	[BILL_DATE] [datetime] NULL,
	[COUNTRY_DESTINATION] [nvarchar](100) NULL,
	[PORT_DESTINATION] [nvarchar](100) NULL,
	[TRANSPORT_TYPE] [nvarchar](30) NULL,
	[PO_ID] [bigint] NULL,
	[ITEM_ID] [bigint] NULL,
	[CUSTOMER_CODE] [nvarchar](100) NULL,
	[RECEIVE_CUSTOMER_CODE] [nvarchar](100) NULL,
	[PAYMENT_CUSTOMER_CODE] [nvarchar](100) NULL,
	[PRICE_TYPE] [nvarchar](30) NULL,
	[PAYMENT_TERM] [nvarchar](30) NULL,
	[PAYMENT_METHOD] [nvarchar](30) NULL,
	[FACTORY_CODE] [nvarchar](30) NULL,
	[INVOICE_STATUS] [nvarchar](50) NULL,
	[COLOR_CODE] [nvarchar](30) NULL,
	[SIZE] [nvarchar](30) NULL,
	[UOM] [nvarchar](30) NULL,
	[CURRENCY] [nvarchar](30) NULL,
	[PRICE_CONTRACT] [float] NULL,
	[DISCOUNT_PERCENT] [float] NULL,
	[PRICE_FOB] [float] NULL,
	[PRICE_PROCESSING] [float] NULL,
	[PRICE_CM] [float] NULL,
	[PRICE_P] [float] NULL,
	[PRICE_T] [float] NULL,
	[PRICE_W] [float] NULL,
	[PRICE_E] [float] NULL,
	[PRICE_PRINT] [float] NULL,
	[PRICE_OTHER] [float] NULL,
	[CLEARANCE_DECLARATION_STYLE] [nvarchar](50) NULL,
	[QUANTITY] [int] NULL,
	[DOCUMENT_AMOUNT] [float] NULL,
	[INVOICE_NUMBER_REF] [varchar](200) NULL,
	[INVOICE_DATE_REF] [varchar](100) NULL,
	[LC_NO] [varchar](100) NULL,
	[BILL_NO] [varchar](100) NULL,
	[INSPECTION] [varchar](10) NULL,
	[GATE] [nvarchar](200) NULL,
	[EXCHANGE_RATE] [float] NULL,
	[QUOTA] [varchar](10) NULL,
	[TERMS_OF_DELIVERY] [varchar](50) NULL,
	[CARTON_QUANTITY] [int] NULL,
	[NET_WEIGHT] [float] NULL,
	[GROSS_WEIGHT] [float] NULL,
	[MEAS] [float] NULL,
	[BAG_QUANTITY] [int] NULL,
	[BANK_DISCOUNT] [nvarchar](200) NULL,
	[ESTIMATED_DATE_OF_DISCOUNT] [datetime] NULL,
	[ETD] [datetime] NULL,
	[ESTIMATED_DISCOUNT_FEE] [float] NULL,
	[BANKING_FEE] [float] NULL,
	[ESTIMATED_DISCOUNT_AMOUNT] [float] NULL,
	[AMOUNT_DUE] [float] NULL,
	[ESTIMATED_AMOUNT_DUE] [float] NULL,
	[ESTIMATED_DISCOUNT_PERCENT] [float] NULL,
	[DISCOUNT_STATUS] [nvarchar](200) NULL,
	[DUE_DATE] [datetime] NULL,
	[DISCOUNT_DATE] [datetime] NULL,
	[DISCOUNT_AMOUNT] [float] NULL,
	[DISCOUNT_RATE] [float] NULL,
	[SOURCE] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_SALES_ORDER_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_SALES_ORDER_F]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[DATE_WID] [bigint] NULL,
	[CONTRACT_WID] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[FACTORY_WID] [bigint] NULL,
	[PO_ID] [bigint] NULL,
	[PO_NUMBER] [varchar](100) NULL,
	[PO_BATCH] [varchar](100) NULL,
	[PO_CREATED_DATE] [datetime] NULL,
	[CUSTOMER_DELIVERY_PLAN_DATE] [datetime] NULL,
	[TPG_DELIVERY_PLAN_DATE] [datetime] NULL,
	[PO_SOURCE] [varchar](50) NULL,
	[ITEM_ID] [bigint] NULL,
	[CUSTOMER_CODE] [varchar](100) NULL,
	[RECEIVE_CUSTOMER_CODE] [varchar](100) NULL,
	[PAYMENT_CUSTOMER_CODE] [varchar](100) NULL,
	[CONTRACT_ID] [bigint] NULL,
	[PO_STATUS] [varchar](50) NULL,
	[PO_NUMBER_REF] [varchar](100) NULL,
	[COLOR_CODE] [varchar](50) NULL,
	[COLOR] [varchar](100) NULL,
	[STYLE] [varchar](100) NULL,
	[SUB_STYLE] [varchar](50) NULL,
	[SIZE] [varchar](50) NULL,
	[COUNTRY] [nvarchar](100) NULL,
	[DIVISION] [nvarchar](100) NULL,
	[LABEL] [varchar](50) NULL,
	[HANGER] [varchar](100) NULL,
	[SEASON] [nvarchar](100) NULL,
	[SEASONCODE] [nvarchar](100) NULL,
	[PLAN_QUANTITY] [int] NULL,
	[MODE_PRICE] [varchar](10) NULL,
	[QUANTITY_DZ] [float] NULL,
	[PRICE_DZ] [float] NULL,
	[UC] [float] NULL,
	[DISCOUNT_PERCENT] [float] NULL,
	[QUANTITY_PCS] [int] NULL,
	[FOB_PRICE] [float] NULL,
	[FOB_PRICE_PO] [float] NULL,
	[PRICE_TOTAL] [float] NULL,
	[PRICE_TOTAL_PO] [float] NULL,
	[VENDOR_CODE] [nvarchar](100) NULL,
	[STYLE_EXPORT] [nvarchar](100) NULL,
	[DELETE_FLAG] [varchar](1) NULL,
	[FIX_SHORTSHIP] [varchar](1) NULL,
	[OVER_SHIP_QUANTITY] [int] NULL,
	[AMOUNT] [float] NULL,
	[PO_PACKING_QUANTITY_PCS] [int] NULL,
	[SOURCE] [varchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_SALES_ORDER_JOURNA_AGG_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_SALES_ORDER_JOURNA_AGG_F]
(
	[CUSTOMER_WID] [bigint] NULL,
	[CUSTOMER_CODE] [nvarchar](200) NULL,
	[SNAPSHOT_DATE_WID] [bigint] NULL,
	[DELIVERY_DATE_WID] [bigint] NULL,
	[CONTRACT_WID] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[PO_ID] [bigint] NULL,
	[ITEM_ID] [bigint] NULL,
	[PLAN_QUANTITY] [int] NULL,
	[PLAN_AMOUNT] [float] NULL,
	[ACTUAL_QUANTITY] [int] NULL,
	[ACTUAL_AMOUNT] [float] NULL,
	[REMAINING_QUANTITY] [int] NULL,
	[REMAINING_AMOUNT] [float] NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_SALES_ORDER_JOURNA_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_SALES_ORDER_JOURNA_F]
(
	[DATE_WID] [bigint] NULL,
	[SNAPSHOT_DATE] [bigint] NULL,
	[ITEM_WID] [bigint] NULL,
	[CONTRACT_WID] [bigint] NULL,
	[CUSTOMER_WID] [bigint] NULL,
	[CREATED_DATE] [datetime] NULL,
	[ITEM_ID] [bigint] NULL,
	[PO_ID] [bigint] NULL,
	[CUSTOMER_DELIVERY_PLAN_DATE] [datetime] NULL,
	[QUANTITY_PCS] [int] NULL,
	[TOTAL] [float] NULL,
	[SOURCE] [nvarchar](50) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [nvarchar](4000) NULL,
	[W_INSERT_DT] [datetime] NOT NULL,
	[W_UPDATE_DT] [datetime] NOT NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = HASH ( [W_INTEGRATION_ID] ),
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_MRP_TRX_TPG_REPORT_YEAR_F]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_MRP_TRX_TPG_REPORT_YEAR_F]
(
	[ROW_WID] [bigint] IDENTITY(1,1) NOT NULL,
	[TYPE] [nvarchar](100) NULL,
	[VALUE] [nvarchar](100) NULL,
	[FACTORY_CODE] [nvarchar](100) NULL,
	[DATE] [datetime] NULL,
	[TOTAL] [float] NULL,
	[TYPE_CONTRACT] [nvarchar](100) NULL,
	[CREATED_DATE] [datetime] NULL,
	[SOURCE] [varchar](100) NULL,
	[W_DELETE_FLG] [varchar](1) NOT NULL,
	[W_INTEGRATION_ID] [varchar](403) NULL,
	[W_VERSION_PERIOD] [int] NULL,
	[W_EFFECTIVE_FROM_DT] [date] NULL,
	[W_EFFECTIVE_TO_DT] [date] NULL,
	[W_CURRENT_FLG] [varchar](1) NOT NULL,
	[W_INSERT_DT] [datetime] NULL,
	[W_UPDATE_DT] [datetime] NULL,
	[W_DATASOURCE_NUM_ID] [int] NOT NULL,
	[W_BATCH_ID] [int] NOT NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [DWH].[W_TIME_D]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DWH].[W_TIME_D]
(
	[TIME_WID] [bigint] NULL,
	[TIME] [time](7) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	CLUSTERED COLUMNSTORE INDEX
)
GO
/****** Object:  Table [STG].[W_CF_DAILY_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_CF_DAILY_FS]
(
	[targets] [nvarchar](max) NULL,
	[total(VND)] [nvarchar](max) NULL,
	[bank] [nvarchar](max) NULL,
	[currency] [nvarchar](max) NULL,
	[amount] [nvarchar](max) NULL,
	[stt] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_CF_MONTHLY_ACTUAL_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_CF_MONTHLY_ACTUAL_FS]
(
	[No] [nvarchar](max) NULL,
	[Line Name] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[Jan] [nvarchar](max) NULL,
	[Feb] [nvarchar](max) NULL,
	[Mar] [nvarchar](max) NULL,
	[Apr] [nvarchar](max) NULL,
	[May] [nvarchar](max) NULL,
	[Jun] [nvarchar](max) NULL,
	[Jul] [nvarchar](max) NULL,
	[Aug] [nvarchar](max) NULL,
	[Sep] [nvarchar](max) NULL,
	[Oct] [nvarchar](max) NULL,
	[Nov] [nvarchar](max) NULL,
	[Dec] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXCEL_CF_AR_AP_MAPPING_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXCEL_CF_AR_AP_MAPPING_DS]
(
	[Customer Code] [nvarchar](max) NULL,
	[Customer Name] [nvarchar](max) NULL,
	[Customer Group] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_ADJUSTED_REVENUE_FORECAST_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_ADJUSTED_REVENUE_FORECAST_FS]
(
	[TYPE] [nvarchar](max) NULL,
	[CUSTOMER] [nvarchar](max) NULL,
	[NOTE] [nvarchar](max) NULL,
	[MONTH_YEAR] [nvarchar](max) NULL,
	[VALUE] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_EXCHANGE_RATE_FORECAST_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_EXCHANGE_RATE_FORECAST_DS]
(
	[FROM_DATE] [nvarchar](max) NULL,
	[FROM_CURRENCY] [nvarchar](max) NULL,
	[TO_CURRENCY] [nvarchar](max) NULL,
	[EXCHANGE_RATE] [bigint] NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_FORECAST_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_FORECAST_FS]
(
	[NO] [nvarchar](max) NULL,
	[NAME] [nvarchar](max) NULL,
	[NOTE] [nvarchar](max) NULL,
	[MONTH_YEAR] [nvarchar](max) NULL,
	[AMT] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_GIACONGNGOAI_FORECAST_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_GIACONGNGOAI_FORECAST_DS]
(
	[KHÁCH HÀNG] [nvarchar](max) NULL,
	[GC MAY NGOÀI ] [float] NULL,
	[GC WASH NGOÀI ] [float] NULL,
	[GC IN] [float] NULL,
	[GC THÊU NGOÀI] [float] NULL,
	[GC KHÁC] [float] NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_LENDING_RATE_FORECAST_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_LENDING_RATE_FORECAST_DS]
(
	[RATE] [nvarchar](max) NULL,
	[BANK_CODE] [nvarchar](max) NULL,
	[CURRENCY] [nvarchar](max) NULL,
	[VALUE] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_NPL_THANHTOAN_FORECAST_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_NPL_THANHTOAN_FORECAST_DS]
(
	[CUSTOMER] [nvarchar](max) NULL,
	[MATERIAL_TYPE] [nvarchar](max) NULL,
	[TITLE] [nvarchar](max) NULL,
	[PAYMENT_TYPE] [nvarchar](max) NULL,
	[VALUE] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_PAYMENT_TERM_FORECAST_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_PAYMENT_TERM_FORECAST_DS]
(
	[LOAI_HINH] [nvarchar](max) NULL,
	[CUSTOMER] [nvarchar](max) NULL,
	[PAYMENT_TERM] [nvarchar](max) NULL,
	[EFFECTIVE_FROM] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_QUOTA_FORECAST_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_QUOTA_FORECAST_DS]
(
	[KHÁCH HÀNG] [nvarchar](max) NULL,
	[NGUYÊN LIỆU (NL)] [float] NULL,
	[PHỤ LIỆU (PL)] [float] NULL,
	[GC MAY NGOÀI ] [nvarchar](max) NULL,
	[GC WASH NGOÀI ] [float] NULL,
	[GC IN] [float] NULL,
	[GC THÊU NGOÀI] [float] NULL,
	[GC KHÁC] [float] NULL,
	[TỔNG] [float] NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_SALARY_FORECAST_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_SALARY_FORECAST_FS]
(
	[FACTORY_NAME] [nvarchar](max) NULL,
	[TITLE] [nvarchar](max) NULL,
	[T1] [nvarchar](max) NULL,
	[T2] [nvarchar](max) NULL,
	[T3] [nvarchar](max) NULL,
	[T4] [nvarchar](max) NULL,
	[T5] [nvarchar](max) NULL,
	[T6] [nvarchar](max) NULL,
	[T7] [nvarchar](max) NULL,
	[T8] [nvarchar](max) NULL,
	[T9] [float] NULL,
	[T10] [float] NULL,
	[T11] [float] NULL,
	[T12] [float] NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_MONTHLY_SX_MDK_FORECAST_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_MONTHLY_SX_MDK_FORECAST_FS]
(
	[BST] [nvarchar](max) NULL,
	[Month 01] [nvarchar](max) NULL,
	[Month 02] [nvarchar](max) NULL,
	[Month 03] [nvarchar](max) NULL,
	[Month 04] [nvarchar](max) NULL,
	[Month 05] [nvarchar](max) NULL,
	[Month 06] [nvarchar](max) NULL,
	[Month 07] [nvarchar](max) NULL,
	[Month 08] [nvarchar](max) NULL,
	[Month 09] [nvarchar](max) NULL,
	[Month 10] [nvarchar](max) NULL,
	[Month 11] [nvarchar](max) NULL,
	[Month 12] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_EXE_CF_WEEKLY_EXPECTED_CASH_FLOW_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_EXE_CF_WEEKLY_EXPECTED_CASH_FLOW_FS]
(
	[STT] [float] NULL,
	[LINE_NAME] [nvarchar](max) NULL,
	[CUSTOMER_CODE] [nvarchar](max) NULL,
	[PAYMENT_METHOD] [nvarchar](max) NULL,
	[AMOUNT] [bigint] NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_ADDRESSES_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_ADDRESSES_DS]
(
	[address1] [nvarchar](max) NULL,
	[address2] [nvarchar](max) NULL,
	[city] [nvarchar](max) NULL,
	[company] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[country_code] [nvarchar](max) NULL,
	[customer_id] [nvarchar](max) NULL,
	[default] [nvarchar](max) NULL,
	[district] [nvarchar](max) NULL,
	[district_code] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[province] [nvarchar](max) NULL,
	[province_code] [nvarchar](max) NULL,
	[ward] [nvarchar](max) NULL,
	[ward_code] [nvarchar](max) NULL,
	[zip] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_COLLECTS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_COLLECTS_DS]
(
	[collection_id] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[featured] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[position] [nvarchar](max) NULL,
	[product_id] [nvarchar](max) NULL,
	[sort_value] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_CUSTOM_COLLECTIONS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_CUSTOM_COLLECTIONS_DS]
(
	[body_html] [nvarchar](max) NULL,
	[handle] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[published] [nvarchar](max) NULL,
	[published_at] [nvarchar](max) NULL,
	[published_scope] [nvarchar](max) NULL,
	[sort_order] [nvarchar](max) NULL,
	[template_suffix] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_CUSTOMERS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_CUSTOMERS_DS]
(
	[accepts_marketing] [nvarchar](max) NULL,
	[birthday] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[default_address_id] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[gender] [nvarchar](max) NULL,
	[group_name] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[last_order_date] [nvarchar](max) NULL,
	[last_order_id] [nvarchar](max) NULL,
	[last_order_name] [nvarchar](max) NULL,
	[multipass_identifier] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[orders_count] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[state] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[total_paid] [nvarchar](max) NULL,
	[total_spent] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[verified_email] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_DISCOUNT_CODES_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_DISCOUNT_CODES_FS]
(
	[amount] [nvarchar](max) NULL,
	[code] [nvarchar](max) NULL,
	[is_coupon_code] [nvarchar](max) NULL,
	[order_id] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_DISCOUNTS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_DISCOUNTS_DS]
(
	[advance_same_prices] [nvarchar](max) NULL,
	[applies_customer_group_id] [nvarchar](max) NULL,
	[applies_once] [nvarchar](max) NULL,
	[applies_to_id] [nvarchar](max) NULL,
	[applies_to_quantity] [nvarchar](max) NULL,
	[applies_to_resource] [nvarchar](max) NULL,
	[channel] [nvarchar](max) NULL,
	[code] [nvarchar](max) NULL,
	[create_user] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[discount_type] [nvarchar](max) NULL,
	[ends_at] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[is_advance_same_price_discount] [nvarchar](max) NULL,
	[is_new_coupon] [nvarchar](max) NULL,
	[is_promotion] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[location_ids] [nvarchar](max) NULL,
	[max_amount_apply] [nvarchar](max) NULL,
	[minimum_order_amount] [nvarchar](max) NULL,
	[order_over] [nvarchar](max) NULL,
	[promotion_apply_type] [nvarchar](max) NULL,
	[starts_at] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[times_used] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[usage_limit] [nvarchar](max) NULL,
	[value] [nvarchar](max) NULL,
	[variants] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_FULFILLMENTS_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_FULFILLMENTS_FS]
(
	[address] [nvarchar](max) NULL,
	[boxme_servicecode] [nvarchar](max) NULL,
	[cancel_date] [nvarchar](max) NULL,
	[carrier_cod_status_code] [nvarchar](max) NULL,
	[carrier_cod_status_name] [nvarchar](max) NULL,
	[carrier_options] [nvarchar](max) NULL,
	[carrier_service_code] [nvarchar](max) NULL,
	[carrier_service_package] [nvarchar](max) NULL,
	[carrier_service_package_name] [nvarchar](max) NULL,
	[carrier_shop_id] [nvarchar](max) NULL,
	[carrier_status_code] [nvarchar](max) NULL,
	[carrier_status_name] [nvarchar](max) NULL,
	[city] [nvarchar](max) NULL,
	[cod_amount] [nvarchar](max) NULL,
	[cod_not_receipt_date] [nvarchar](max) NULL,
	[cod_paid_date] [nvarchar](max) NULL,
	[cod_pending_date] [nvarchar](max) NULL,
	[cod_receipt_date] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[country_code] [nvarchar](max) NULL,
	[coupon_code] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[delivered_date] [nvarchar](max) NULL,
	[delivering_date] [nvarchar](max) NULL,
	[district] [nvarchar](max) NULL,
	[district_code] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[from_latitude] [nvarchar](max) NULL,
	[from_longtitude] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[insurance_price] [nvarchar](max) NULL,
	[is_drop_off] [nvarchar](max) NULL,
	[is_insurance] [nvarchar](max) NULL,
	[is_new_service_package] [nvarchar](max) NULL,
	[is_open_box] [nvarchar](max) NULL,
	[is_view_before] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[line_items] [nvarchar](max) NULL,
	[location_id] [nvarchar](max) NULL,
	[not_meet_customer_date] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[note_attributes] [nvarchar](max) NULL,
	[notify_customer] [nvarchar](max) NULL,
	[order_id] [nvarchar](max) NULL,
	[package_height] [nvarchar](max) NULL,
	[package_length] [nvarchar](max) NULL,
	[package_width] [nvarchar](max) NULL,
	[picking_date] [nvarchar](max) NULL,
	[province] [nvarchar](max) NULL,
	[province_code] [nvarchar](max) NULL,
	[ready_to_pick_date] [nvarchar](max) NULL,
	[real_shipping_fee] [nvarchar](max) NULL,
	[receipt] [nvarchar](max) NULL,
	[request_id] [nvarchar](max) NULL,
	[return_date] [nvarchar](max) NULL,
	[sender_name] [nvarchar](max) NULL,
	[sender_phone] [nvarchar](max) NULL,
	[shipping_address] [nvarchar](max) NULL,
	[shipping_notes] [nvarchar](max) NULL,
	[shipping_package] [nvarchar](max) NULL,
	[shipping_phone] [nvarchar](max) NULL,
	[sort_code] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[to_latitude] [nvarchar](max) NULL,
	[to_longtitude] [nvarchar](max) NULL,
	[total_weight] [nvarchar](max) NULL,
	[tracking_company] [nvarchar](max) NULL,
	[tracking_company_code] [nvarchar](max) NULL,
	[tracking_number] [nvarchar](max) NULL,
	[tracking_numbers] [nvarchar](max) NULL,
	[tracking_url] [nvarchar](max) NULL,
	[tracking_urls] [nvarchar](max) NULL,
	[transport_type] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[waiting_for_return_date] [nvarchar](max) NULL,
	[ward] [nvarchar](max) NULL,
	[ward_code] [nvarchar](max) NULL,
	[zip_code] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_IMAGES_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_IMAGES_DS]
(
	[created_at] [nvarchar](max) NULL,
	[filename] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[position] [nvarchar](max) NULL,
	[product_id] [nvarchar](max) NULL,
	[src] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[variant_ids] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_LINE_ITEMS_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_LINE_ITEMS_FS]
(
	[applied_discounts] [nvarchar](max) NULL,
	[barcode] [nvarchar](max) NULL,
	[fulfillable_quantity] [nvarchar](max) NULL,
	[fulfillment_service] [nvarchar](max) NULL,
	[fulfillment_status] [nvarchar](max) NULL,
	[gift_card] [nvarchar](max) NULL,
	[grams] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[ma_cost_amount] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[not_allow_promotion] [nvarchar](max) NULL,
	[order_id] [nvarchar](max) NULL,
	[price] [nvarchar](max) NULL,
	[price_original] [nvarchar](max) NULL,
	[price_promotion] [nvarchar](max) NULL,
	[product_exists] [nvarchar](max) NULL,
	[product_id] [nvarchar](max) NULL,
	[properties] [nvarchar](max) NULL,
	[quantity] [nvarchar](max) NULL,
	[requires_shipping] [nvarchar](max) NULL,
	[sku] [nvarchar](max) NULL,
	[tax_lines] [nvarchar](max) NULL,
	[taxable] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[total_discount] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[variant_id] [nvarchar](max) NULL,
	[variant_title] [nvarchar](max) NULL,
	[vendor] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_LOCATIONS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_LOCATIONS_DS]
(
	[address1] [nvarchar](max) NULL,
	[address2] [nvarchar](max) NULL,
	[city] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
	[country_code] [nvarchar](max) NULL,
	[country_name] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[district] [nvarchar](max) NULL,
	[district_code] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[is_primary] [nvarchar](max) NULL,
	[is_unavailable_quantity] [nvarchar](max) NULL,
	[location_type] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[province] [nvarchar](max) NULL,
	[province_code] [nvarchar](max) NULL,
	[type] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[ward] [nvarchar](max) NULL,
	[ward_code] [nvarchar](max) NULL,
	[zip] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_ORDERS_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_ORDERS_FS]
(
	[billing_address1] [nvarchar](max) NULL,
	[billing_address2] [nvarchar](max) NULL,
	[billing_city] [nvarchar](max) NULL,
	[billing_company] [nvarchar](max) NULL,
	[billing_country] [nvarchar](max) NULL,
	[billing_country_code] [nvarchar](max) NULL,
	[billing_default] [nvarchar](max) NULL,
	[billing_district] [nvarchar](max) NULL,
	[billing_district_code] [nvarchar](max) NULL,
	[billing_first_name] [nvarchar](max) NULL,
	[billing_id] [nvarchar](max) NULL,
	[billing_last_name] [nvarchar](max) NULL,
	[billing_name] [nvarchar](max) NULL,
	[billing_phone] [nvarchar](max) NULL,
	[billing_province] [nvarchar](max) NULL,
	[billing_province_code] [nvarchar](max) NULL,
	[billing_ward] [nvarchar](max) NULL,
	[billing_ward_code] [nvarchar](max) NULL,
	[billing_zip] [nvarchar](max) NULL,
	[browser_ip] [nvarchar](max) NULL,
	[buyer_accepts_marketing] [nvarchar](max) NULL,
	[cancel_reason] [nvarchar](max) NULL,
	[cancelled_at] [nvarchar](max) NULL,
	[cancelled_status] [nvarchar](max) NULL,
	[cart_token] [nvarchar](max) NULL,
	[checkout_token] [nvarchar](max) NULL,
	[client_details] [nvarchar](max) NULL,
	[closed_at] [nvarchar](max) NULL,
	[closed_status] [nvarchar](max) NULL,
	[complete_at] [nvarchar](max) NULL,
	[confirmed_at] [nvarchar](max) NULL,
	[confirmed_status] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[currency] [nvarchar](max) NULL,
	[customer_id] [nvarchar](max) NULL,
	[device_id] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[export_at] [nvarchar](max) NULL,
	[financial_status] [nvarchar](max) NULL,
	[fulfillment_status] [nvarchar](max) NULL,
	[gateway] [nvarchar](max) NULL,
	[gateway_code] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[in_stock_at] [nvarchar](max) NULL,
	[landing_site] [nvarchar](max) NULL,
	[landing_site_ref] [nvarchar](max) NULL,
	[location_assigned_at] [nvarchar](max) NULL,
	[location_id] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[note_attributes] [nvarchar](max) NULL,
	[number] [nvarchar](max) NULL,
	[omni_order_status] [nvarchar](max) NULL,
	[omni_order_status_name] [nvarchar](max) NULL,
	[order_number] [nvarchar](max) NULL,
	[out_of_stock_at] [nvarchar](max) NULL,
	[processing_method] [nvarchar](max) NULL,
	[redeem_model] [nvarchar](max) NULL,
	[ref_order_id] [nvarchar](max) NULL,
	[ref_order_number] [nvarchar](max) NULL,
	[referring_site] [nvarchar](max) NULL,
	[shipping_address1] [nvarchar](max) NULL,
	[shipping_address2] [nvarchar](max) NULL,
	[shipping_city] [nvarchar](max) NULL,
	[shipping_company] [nvarchar](max) NULL,
	[shipping_country] [nvarchar](max) NULL,
	[shipping_country_code] [nvarchar](max) NULL,
	[shipping_district] [nvarchar](max) NULL,
	[shipping_district_code] [nvarchar](max) NULL,
	[shipping_first_name] [nvarchar](max) NULL,
	[shipping_last_name] [nvarchar](max) NULL,
	[shipping_latitude] [nvarchar](max) NULL,
	[shipping_longitude] [nvarchar](max) NULL,
	[shipping_name] [nvarchar](max) NULL,
	[shipping_phone] [nvarchar](max) NULL,
	[shipping_province] [nvarchar](max) NULL,
	[shipping_province_code] [nvarchar](max) NULL,
	[shipping_ward] [nvarchar](max) NULL,
	[shipping_ward_code] [nvarchar](max) NULL,
	[shipping_zip] [nvarchar](max) NULL,
	[source] [nvarchar](max) NULL,
	[source_name] [nvarchar](max) NULL,
	[subtotal_price] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[tax_lines] [nvarchar](max) NULL,
	[taxes_included] [nvarchar](max) NULL,
	[token] [nvarchar](max) NULL,
	[total_discounts] [nvarchar](max) NULL,
	[total_line_items_price] [nvarchar](max) NULL,
	[total_price] [nvarchar](max) NULL,
	[total_tax] [nvarchar](max) NULL,
	[total_weight] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[user_id] [nvarchar](max) NULL,
	[utm_campaign] [nvarchar](max) NULL,
	[utm_content] [nvarchar](max) NULL,
	[utm_medium] [nvarchar](max) NULL,
	[utm_source] [nvarchar](max) NULL,
	[utm_term] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_PRODUCTS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_PRODUCTS_DS]
(
	[body_html] [nvarchar](max) NULL,
	[body_plain] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[handle] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[not_allow_promotion] [nvarchar](max) NULL,
	[only_hide_from_list] [nvarchar](max) NULL,
	[options] [nvarchar](max) NULL,
	[product_type] [nvarchar](max) NULL,
	[published_at] [nvarchar](max) NULL,
	[published_scope] [nvarchar](max) NULL,
	[tags] [nvarchar](max) NULL,
	[template_suffix] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[vendor] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_PROMOTION_LINE_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_PROMOTION_LINE_FS]
(
	[name] [nvarchar](max) NULL,
	[order_line_id] [nvarchar](max) NULL,
	[promotion_id] [nvarchar](max) NULL,
	[promotion_name] [nvarchar](max) NULL,
	[value] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_PROMOTIONS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_PROMOTIONS_DS]
(
	[applies_customer_group_id] [nvarchar](max) NULL,
	[applies_to_id] [nvarchar](max) NULL,
	[applies_to_quantity] [nvarchar](max) NULL,
	[applies_to_resource] [nvarchar](max) NULL,
	[create_user] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[discount_type] [nvarchar](max) NULL,
	[ends_at] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[order_over] [nvarchar](max) NULL,
	[promotion_apply_type] [nvarchar](max) NULL,
	[set_time_active] [nvarchar](max) NULL,
	[starts_at] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[value] [nvarchar](max) NULL,
	[variants] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_REDEEM_MODEL_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_REDEEM_MODEL_FS]
(
	[amount] [nvarchar](max) NULL,
	[discount] [nvarchar](max) NULL,
	[discount_type] [nvarchar](max) NULL,
	[max_per_order] [nvarchar](max) NULL,
	[name] [nvarchar](max) NULL,
	[order_id] [nvarchar](max) NULL,
	[payload_id] [nvarchar](max) NULL,
	[transaction_id] [nvarchar](max) NULL,
	[used_amount] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_REFUND_LINE_ITEMS_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_REFUND_LINE_ITEMS_FS]
(
	[id] [nvarchar](max) NULL,
	[line_item] [nvarchar](max) NULL,
	[line_item_id] [nvarchar](max) NULL,
	[price] [nvarchar](max) NULL,
	[quantity] [nvarchar](max) NULL,
	[refund_id] [nvarchar](max) NULL,
	[variant_id] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_REFUNDS_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_REFUNDS_FS]
(
	[created_at] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[note] [nvarchar](max) NULL,
	[order_id] [nvarchar](max) NULL,
	[restock] [nvarchar](max) NULL,
	[user_id] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_RULES_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_RULES_DS]
(
	[column] [nvarchar](max) NULL,
	[condition] [nvarchar](max) NULL,
	[relation] [nvarchar](max) NULL,
	[smart_collection_id] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_SHIPPING_LINES_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_SHIPPING_LINES_FS]
(
	[code] [nvarchar](max) NULL,
	[order_id] [nvarchar](max) NULL,
	[price] [nvarchar](max) NULL,
	[source] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_SMART_COLLECTIONS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_SMART_COLLECTIONS_DS]
(
	[body_html] [nvarchar](max) NULL,
	[disjunctive] [nvarchar](max) NULL,
	[handle] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[published_at] [nvarchar](max) NULL,
	[published_scope] [nvarchar](max) NULL,
	[sort_order] [nvarchar](max) NULL,
	[template_suffix] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_TRANSACTIONS_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_TRANSACTIONS_FS]
(
	[amount] [nvarchar](max) NULL,
	[authorization] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[currency] [nvarchar](max) NULL,
	[device_id] [nvarchar](max) NULL,
	[external_transaction_id] [nvarchar](max) NULL,
	[gateway] [nvarchar](max) NULL,
	[haravan_transaction_id] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[kind] [nvarchar](max) NULL,
	[location_id] [nvarchar](max) NULL,
	[order_id] [nvarchar](max) NULL,
	[parent_id] [nvarchar](max) NULL,
	[payment_details] [nvarchar](max) NULL,
	[receipt] [nvarchar](max) NULL,
	[refund_id] [nvarchar](max) NULL,
	[send_email] [nvarchar](max) NULL,
	[status] [nvarchar](max) NULL,
	[test] [nvarchar](max) NULL,
	[user_id] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_USERS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_USERS_DS]
(
	[account_owner] [nvarchar](max) NULL,
	[bio] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[first_name] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[im] [nvarchar](max) NULL,
	[last_name] [nvarchar](max) NULL,
	[permissions] [nvarchar](max) NULL,
	[phone] [nvarchar](max) NULL,
	[receive_announcements] [nvarchar](max) NULL,
	[url] [nvarchar](max) NULL,
	[user_type] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_HAR_VARIANTS_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_HAR_VARIANTS_DS]
(
	[barcode] [nvarchar](max) NULL,
	[compare_at_price] [nvarchar](max) NULL,
	[created_at] [nvarchar](max) NULL,
	[fulfillment_service] [nvarchar](max) NULL,
	[grams] [nvarchar](max) NULL,
	[id] [nvarchar](max) NULL,
	[image_id] [nvarchar](max) NULL,
	[inventory_advance] [nvarchar](max) NULL,
	[inventory_management] [nvarchar](max) NULL,
	[inventory_policy] [nvarchar](max) NULL,
	[inventory_quantity] [nvarchar](max) NULL,
	[option1] [nvarchar](max) NULL,
	[option2] [nvarchar](max) NULL,
	[option3] [nvarchar](max) NULL,
	[position] [nvarchar](max) NULL,
	[price] [nvarchar](max) NULL,
	[product_id] [nvarchar](max) NULL,
	[requires_shipping] [nvarchar](max) NULL,
	[sku] [nvarchar](max) NULL,
	[taxable] [nvarchar](max) NULL,
	[title] [nvarchar](max) NULL,
	[updated_at] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_AP_BALANCE_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_AP_BALANCE_FS]
(
	[AccountID] [nvarchar](max) NULL,
	[AP Amount] [nvarchar](max) NULL,
	[AP Amount2] [nvarchar](max) NULL,
	[CurrencyID] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Due Date] [nvarchar](max) NULL,
	[ExchangeRate] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Extract Date] [nvarchar](max) NULL,
	[Invoice] [nvarchar](max) NULL,
	[Invoice Date] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[LastAdjustedAmt] [nvarchar](max) NULL,
	[LastAdjustedDate] [nvarchar](max) NULL,
	[Vendor Group] [nvarchar](max) NULL,
	[Oustanding Amount] [nvarchar](max) NULL,
	[Oustanding Amount2] [nvarchar](max) NULL,
	[Paid Amount] [nvarchar](max) NULL,
	[Paid Amount2] [nvarchar](max) NULL,
	[Payment Method] [nvarchar](max) NULL,
	[Payment Term] [nvarchar](max) NULL,
	[RecID] [nvarchar](max) NULL,
	[Supplier Code] [nvarchar](max) NULL,
	[TransDate] [nvarchar](max) NULL,
	[TransNo] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_AP_PAYMENT_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_AP_PAYMENT_FS]
(
	[AccountID] [nvarchar](max) NULL,
	[CurrencyID] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[ExchangeRate] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[ExtractDate] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Memo] [nvarchar](max) NULL,
	[ObjectID] [nvarchar](max) NULL,
	[RecID] [nvarchar](max) NULL,
	[SettledAmt] [nvarchar](max) NULL,
	[SettledAmt2] [nvarchar](max) NULL,
	[SettledID] [nvarchar](max) NULL,
	[TransDate] [nvarchar](max) NULL,
	[TransNo] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_AR_BALANCE_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_AR_BALANCE_FS]
(
	[AccountID] [nvarchar](max) NULL,
	[AR Amount] [nvarchar](max) NULL,
	[AR Amount2] [nvarchar](max) NULL,
	[CurrencyID] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Due Date] [nvarchar](max) NULL,
	[ExchangeRate] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Extract Date] [nvarchar](max) NULL,
	[Invoice] [nvarchar](max) NULL,
	[Invoice Date] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[LastAdjustedAmt] [nvarchar](max) NULL,
	[LastAdjustedDate] [nvarchar](max) NULL,
	[Customer Group] [nvarchar](max) NULL,
	[Oustanding Amount] [nvarchar](max) NULL,
	[Oustanding Amount2] [nvarchar](max) NULL,
	[Paid Amount] [nvarchar](max) NULL,
	[Paid Amount2] [nvarchar](max) NULL,
	[Payment Method] [nvarchar](max) NULL,
	[Payment Term] [nvarchar](max) NULL,
	[RecID] [nvarchar](max) NULL,
	[Customer Code] [nvarchar](max) NULL,
	[TransDate] [nvarchar](max) NULL,
	[TransNo] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_AR_PAYMENT_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_AR_PAYMENT_FS]
(
	[AccountID] [nvarchar](max) NULL,
	[CurrencyID] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[ExchangeRate] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[ExtractDate] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Memo] [nvarchar](max) NULL,
	[ObjectID] [nvarchar](max) NULL,
	[RecID] [nvarchar](max) NULL,
	[SettledAmt] [nvarchar](max) NULL,
	[SettledAmt2] [nvarchar](max) NULL,
	[SettledID] [nvarchar](max) NULL,
	[TransDate] [nvarchar](max) NULL,
	[TransNo] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_CF_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_CF_DS]
(
	[STT] [nvarchar](max) NULL,
	[Report_View] [nvarchar](max) NULL,
	[Lv1 Code] [nvarchar](max) NULL,
	[Lv1 Name] [nvarchar](max) NULL,
	[Lv2 Code] [nvarchar](max) NULL,
	[Lv2 Name] [nvarchar](max) NULL,
	[Lv3 Code] [nvarchar](max) NULL,
	[Lv3 Name] [nvarchar](max) NULL,
	[Lv4 Code] [nvarchar](max) NULL,
	[Lv4 Name] [nvarchar](max) NULL,
	[Lv5 Code] [nvarchar](max) NULL,
	[Lv5 Name] [nvarchar](max) NULL,
	[AccountID] [nvarchar](max) NULL,
	[OffsetacctID] [nvarchar](max) NULL,
	[ObjectID] [nvarchar](max) NULL,
	[Memo] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Sign] [nvarchar](max) NULL,
	[Formula] [nvarchar](max) NULL,
	[Isshow] [nvarchar](max) NULL,
	[Manual] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_CF_MONTHLY_ACTUAL_OPENING_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_CF_MONTHLY_ACTUAL_OPENING_FS]
(
	[No] [nvarchar](max) NULL,
	[Line Name] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[2021-06-01 00:00:00] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_CF_WEEKLY_BANK_DISCOUNT_RATE_CONFIG_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_CF_WEEKLY_BANK_DISCOUNT_RATE_CONFIG_DS]
(
	[Ngân hàng] [nvarchar](max) NULL,
	[W01] [float] NULL,
	[W02] [float] NULL,
	[W03] [float] NULL,
	[W04] [float] NULL,
	[W05] [float] NULL,
	[W06] [float] NULL,
	[W07] [float] NULL,
	[W08] [float] NULL,
	[W09] [float] NULL,
	[W10] [float] NULL,
	[W11] [float] NULL,
	[W12] [float] NULL,
	[W13] [float] NULL,
	[W14] [float] NULL,
	[W15] [float] NULL,
	[W16] [float] NULL,
	[W17] [float] NULL,
	[W18] [float] NULL,
	[W19] [float] NULL,
	[W20] [float] NULL,
	[W21] [float] NULL,
	[W22] [float] NULL,
	[W23] [float] NULL,
	[W24] [float] NULL,
	[W25] [float] NULL,
	[W26] [float] NULL,
	[W27] [float] NULL,
	[W28] [float] NULL,
	[W29] [float] NULL,
	[W30] [float] NULL,
	[W31] [float] NULL,
	[W32] [float] NULL,
	[W33] [float] NULL,
	[W34] [float] NULL,
	[W35] [float] NULL,
	[W36] [float] NULL,
	[W37] [float] NULL,
	[W38] [float] NULL,
	[W39] [float] NULL,
	[W40] [float] NULL,
	[W41] [float] NULL,
	[W42] [float] NULL,
	[W43] [float] NULL,
	[W44] [float] NULL,
	[W45] [float] NULL,
	[W46] [float] NULL,
	[W47] [float] NULL,
	[W48] [float] NULL,
	[W49] [float] NULL,
	[W50] [float] NULL,
	[W51] [float] NULL,
	[W52] [float] NULL,
	[W53] [float] NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_CF_WEEKLY_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_CF_WEEKLY_FS]
(
	[No] [nvarchar](max) NULL,
	[Line Name] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[W01] [nvarchar](max) NULL,
	[W02] [nvarchar](max) NULL,
	[W03] [nvarchar](max) NULL,
	[W04] [nvarchar](max) NULL,
	[W05] [nvarchar](max) NULL,
	[W06] [nvarchar](max) NULL,
	[W07] [nvarchar](max) NULL,
	[W08] [nvarchar](max) NULL,
	[W09] [nvarchar](max) NULL,
	[W10] [nvarchar](max) NULL,
	[W11] [nvarchar](max) NULL,
	[W12] [nvarchar](max) NULL,
	[W13] [nvarchar](max) NULL,
	[W14] [nvarchar](max) NULL,
	[W15] [nvarchar](max) NULL,
	[W16] [nvarchar](max) NULL,
	[W17] [nvarchar](max) NULL,
	[W18] [nvarchar](max) NULL,
	[W19] [nvarchar](max) NULL,
	[W20] [nvarchar](max) NULL,
	[W21] [nvarchar](max) NULL,
	[W22] [nvarchar](max) NULL,
	[W23] [nvarchar](max) NULL,
	[W24] [nvarchar](max) NULL,
	[W25] [nvarchar](max) NULL,
	[W26] [nvarchar](max) NULL,
	[W27] [nvarchar](max) NULL,
	[W28] [nvarchar](max) NULL,
	[W29] [nvarchar](max) NULL,
	[W30] [nvarchar](max) NULL,
	[W31] [nvarchar](max) NULL,
	[W32] [nvarchar](max) NULL,
	[W33] [nvarchar](max) NULL,
	[W34] [nvarchar](max) NULL,
	[W35] [nvarchar](max) NULL,
	[W36] [nvarchar](max) NULL,
	[W37] [nvarchar](max) NULL,
	[W38] [nvarchar](max) NULL,
	[W39] [nvarchar](max) NULL,
	[W40] [nvarchar](max) NULL,
	[W41] [nvarchar](max) NULL,
	[W42] [nvarchar](max) NULL,
	[W43] [nvarchar](max) NULL,
	[W44] [nvarchar](max) NULL,
	[W45] [nvarchar](max) NULL,
	[W46] [nvarchar](max) NULL,
	[W47] [nvarchar](max) NULL,
	[W48] [nvarchar](max) NULL,
	[W49] [nvarchar](max) NULL,
	[W50] [nvarchar](max) NULL,
	[W51] [nvarchar](max) NULL,
	[W52] [nvarchar](max) NULL,
	[W53] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_CF_WEEKLY_REPORTING_LINE_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_CF_WEEKLY_REPORTING_LINE_DS]
(
	[STT] [bigint] NULL,
	[LV1_CODE] [nvarchar](max) NULL,
	[LV1_NAME] [nvarchar](max) NULL,
	[LV2_CODE] [nvarchar](max) NULL,
	[LV2_NAME] [nvarchar](max) NULL,
	[LV3_CODE] [nvarchar](max) NULL,
	[LV3_NAME] [nvarchar](max) NULL,
	[FORMULA] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_CUSTOMER_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_CUSTOMER_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Customer Group] [nvarchar](max) NULL,
	[Customer Code] [nvarchar](max) NULL,
	[Customer Name] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_GL_ACCOUNT_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_GL_ACCOUNT_DS]
(
	[Account Code] [nvarchar](max) NULL,
	[Account Name] [nvarchar](max) NULL,
	[Account Description] [nvarchar](max) NULL,
	[Account Type] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Parent Account] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_GL_DATA_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_GL_DATA_FS]
(
	[AccountID] [nvarchar](max) NULL,
	[Crediting] [nvarchar](max) NULL,
	[CurrencyID] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[DIM1] [nvarchar](max) NULL,
	[DIM2] [nvarchar](max) NULL,
	[DIM3] [nvarchar](max) NULL,
	[ExchangeRate] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Memo] [nvarchar](max) NULL,
	[ObjectID] [nvarchar](max) NULL,
	[ObjectName] [nvarchar](max) NULL,
	[ObjectType] [nvarchar](max) NULL,
	[OffsetAcctID] [nvarchar](max) NULL,
	[PostedOn] [nvarchar](max) NULL,
	[ProjectID] [nvarchar](max) NULL,
	[RecID] [nvarchar](max) NULL,
	[TransAmt] [nvarchar](max) NULL,
	[TransAmt2] [nvarchar](max) NULL,
	[TransDate] [nvarchar](max) NULL,
	[TransNo] [nvarchar](max) NULL,
	[TransType] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_SUPPLIER_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_SUPPLIER_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Supplier Group] [nvarchar](max) NULL,
	[Supplier Code] [nvarchar](max) NULL,
	[Supplier Name] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_LAC_TRIAL_BALANCE_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_LAC_TRIAL_BALANCE_FS]
(
	[TransDate] [nvarchar](max) NULL,
	[Account Code] [nvarchar](max) NULL,
	[Offset Account Code] [nvarchar](max) NULL,
	[Transaction Amt] [nvarchar](max) NULL,
	[D/C Indicator] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_AMAZON_SALE_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_AMAZON_SALE_FS]
(
	[STORE CODE] [nvarchar](max) NULL,
	[STORE NAME] [nvarchar](max) NULL,
	[POSTED_DATE] [nvarchar](max) NULL,
	[PERIOD] [nvarchar](max) NULL,
	[ORDER_ID] [nvarchar](max) NULL,
	[SKU_AMZ] [nvarchar](max) NULL,
	[SKU_MDK] [nvarchar](max) NULL,
	[AMT] [nvarchar](max) NULL,
	[QTY] [nvarchar](max) NULL,
	[POS HRV] [nvarchar](max) NULL,
	[REFUND QTY] [nvarchar](max) NULL,
	[REFUND AMT] [nvarchar](max) NULL,
	[ACT QTY] [nvarchar](max) NULL,
	[ACT AMOUNT] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_AOP_SALE_AMOUNT_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_AOP_SALE_AMOUNT_FS]
(
	[Store Code] [nvarchar](max) NULL,
	[Store Name] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[Jan] [nvarchar](max) NULL,
	[Feb] [nvarchar](max) NULL,
	[Mar] [nvarchar](max) NULL,
	[Apr] [nvarchar](max) NULL,
	[May] [nvarchar](max) NULL,
	[Jun] [nvarchar](max) NULL,
	[Jul] [nvarchar](max) NULL,
	[Aug] [nvarchar](max) NULL,
	[Sep] [nvarchar](max) NULL,
	[Oct] [nvarchar](max) NULL,
	[Nov] [nvarchar](max) NULL,
	[Dec] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_AOP_SALE_QUANTITY_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_AOP_SALE_QUANTITY_FS]
(
	[Store Code] [nvarchar](max) NULL,
	[Store Name] [nvarchar](max) NULL,
	[UOM] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[Jan] [nvarchar](max) NULL,
	[Feb] [nvarchar](max) NULL,
	[Mar] [nvarchar](max) NULL,
	[Apr] [nvarchar](max) NULL,
	[May] [nvarchar](max) NULL,
	[Jun] [nvarchar](max) NULL,
	[Jul] [nvarchar](max) NULL,
	[Aug] [nvarchar](max) NULL,
	[Sep] [nvarchar](max) NULL,
	[Oct] [nvarchar](max) NULL,
	[Nov] [nvarchar](max) NULL,
	[Dec] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_COOP_SALE_AMOUNT_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_COOP_SALE_AMOUNT_FS]
(
	[STORE CODE] [nvarchar](max) NULL,
	[STORE NAME] [nvarchar](max) NULL,
	[YEAR] [nvarchar](max) NULL,
	[JAN] [nvarchar](max) NULL,
	[FEB] [nvarchar](max) NULL,
	[MAR] [nvarchar](max) NULL,
	[APR] [nvarchar](max) NULL,
	[MAY] [nvarchar](max) NULL,
	[JUN] [nvarchar](max) NULL,
	[JUL] [nvarchar](max) NULL,
	[AUG] [nvarchar](max) NULL,
	[SEP] [nvarchar](max) NULL,
	[OCT] [nvarchar](max) NULL,
	[NOV] [nvarchar](max) NULL,
	[DEC] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_COOP_SALE_QUANTITY_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_COOP_SALE_QUANTITY_FS]
(
	[STORE CODE] [nvarchar](max) NULL,
	[STORE NAME] [nvarchar](max) NULL,
	[YEAR] [nvarchar](max) NULL,
	[JAN] [nvarchar](max) NULL,
	[FEB] [nvarchar](max) NULL,
	[MAR] [nvarchar](max) NULL,
	[APR] [nvarchar](max) NULL,
	[MAY] [nvarchar](max) NULL,
	[JUN] [nvarchar](max) NULL,
	[JUL] [nvarchar](max) NULL,
	[AUG] [nvarchar](max) NULL,
	[SEP] [nvarchar](max) NULL,
	[OCT] [nvarchar](max) NULL,
	[NOV] [nvarchar](max) NULL,
	[DEC] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_PAYMENT_METHOD_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_PAYMENT_METHOD_DS]
(
	[Payment Group] [nvarchar](max) NULL,
	[Payment Method] [nvarchar](max) NULL,
	[Payment Name] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_PRODUCT_MAPPING_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_PRODUCT_MAPPING_DS]
(
	[Version_Code] [nvarchar](max) NULL,
	[Barcode] [nvarchar](max) NULL,
	[Parent_Skus] [nvarchar](max) NULL,
	[Season] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[Line] [nvarchar](max) NULL,
	[Dòng hàng_2021] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[Chủng loại upload HRV] [nvarchar](max) NULL,
	[Category_New] [nvarchar](max) NULL,
	[Subcate_2021] [nvarchar](max) NULL,
	[Material] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[Color name] [nvarchar](max) NULL,
	[Color code] [nvarchar](max) NULL,
	[Colorgroup] [nvarchar](max) NULL,
	[Sihouette] [nvarchar](max) NULL,
	[Nguyên giá] [nvarchar](max) NULL,
	[Selling_Price] [nvarchar](max) NULL,
	[Selling_Price_FromDate] [nvarchar](max) NULL,
	[Brand] [nvarchar](max) NULL,
	[Ghi chú] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_SALE_TARGET_AMOUNT_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_SALE_TARGET_AMOUNT_FS]
(
	[Store Code] [nvarchar](max) NULL,
	[Store Name] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[Jan] [nvarchar](max) NULL,
	[Feb] [nvarchar](max) NULL,
	[Mar] [nvarchar](max) NULL,
	[Apr] [nvarchar](max) NULL,
	[May] [nvarchar](max) NULL,
	[Jun] [nvarchar](max) NULL,
	[Jul] [nvarchar](max) NULL,
	[Aug] [nvarchar](max) NULL,
	[Sep] [nvarchar](max) NULL,
	[Oct] [nvarchar](max) NULL,
	[Nov] [nvarchar](max) NULL,
	[Dec] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_SALE_TARGET_QUANTITY_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_SALE_TARGET_QUANTITY_FS]
(
	[Store Code] [nvarchar](max) NULL,
	[Store Name] [nvarchar](max) NULL,
	[UOM] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[Jan] [nvarchar](max) NULL,
	[Feb] [nvarchar](max) NULL,
	[Mar] [nvarchar](max) NULL,
	[Apr] [nvarchar](max) NULL,
	[May] [nvarchar](max) NULL,
	[Jun] [nvarchar](max) NULL,
	[Jul] [nvarchar](max) NULL,
	[Aug] [nvarchar](max) NULL,
	[Sep] [nvarchar](max) NULL,
	[Oct] [nvarchar](max) NULL,
	[Nov] [nvarchar](max) NULL,
	[Dec] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_STORE_GFA_STAFF_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_STORE_GFA_STAFF_DS]
(
	[Store Code] [nvarchar](max) NULL,
	[Store Name] [nvarchar](max) NULL,
	[GFA m2] [float] NULL,
	[Num of Staff] [float] NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MDK_SUBCHANNEL_MAPPING_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MDK_SUBCHANNEL_MAPPING_DS]
(
	[Haravan_StoreName] [nvarchar](max) NULL,
	[StoreName] [nvarchar](max) NULL,
	[SubChannel] [nvarchar](max) NULL,
	[Channel] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_CALENDAR_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_CALENDAR_DS]
(
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Holiday Name] [nvarchar](max) NULL,
	[Calendar Type] [nvarchar](max) NULL,
	[Department] [nvarchar](max) NULL,
	[Company] [nvarchar](max) NULL,
	[Day] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Working Hour] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_CONTRACT_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_CONTRACT_FS]
(
	[Contract Parent Type Group] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Delivery Register] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Delivery Type] [nvarchar](max) NULL,
	[Contract Id] [nvarchar](max) NULL,
	[Contract Type Group] [nvarchar](max) NULL,
	[Production Type] [nvarchar](max) NULL,
	[Curency] [nvarchar](max) NULL,
	[Customer  Code] [nvarchar](max) NULL,
	[Contract Type Code] [nvarchar](max) NULL,
	[Payment Term Code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Start Contract Date] [nvarchar](max) NULL,
	[Complete  Contract Date] [nvarchar](max) NULL,
	[Signed Date] [nvarchar](max) NULL,
	[Contact Person] [nvarchar](max) NULL,
	[Quantity] [nvarchar](max) NULL,
	[Contract Number] [nvarchar](max) NULL,
	[Contract Type Name] [nvarchar](max) NULL,
	[Salesman Code] [nvarchar](max) NULL,
	[Document Amount] [nvarchar](max) NULL,
	[Exchange Rate] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_CUSTOMER_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_CUSTOMER_DS]
(
	[Customer Code] [nvarchar](max) NULL,
	[Customer Name] [nvarchar](max) NULL,
	[Group] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Brand] [nvarchar](max) NULL,
	[Representative] [nvarchar](max) NULL,
	[Person Contact] [nvarchar](max) NULL,
	[Customer Type] [nvarchar](max) NULL,
	[Address1] [nvarchar](max) NULL,
	[Address2] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Customer Created Date] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_DEPARTMENT_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_DEPARTMENT_DS]
(
	[Department Code] [nvarchar](max) NULL,
	[Department Name] [nvarchar](max) NULL,
	[LacViet Code] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Is Line] [nvarchar](max) NULL,
	[Is Plan] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_EXCHANGE_RATE_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_EXCHANGE_RATE_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Exchange Rate] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[FromDate] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_FACTORY_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_FACTORY_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Factory Address] [nvarchar](max) NULL,
	[Company Address] [nvarchar](max) NULL,
	[Factory Phone] [nvarchar](max) NULL,
	[Company Email] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Factory Short Name] [nvarchar](max) NULL,
	[Company Fax] [nvarchar](max) NULL,
	[Factory Name] [nvarchar](max) NULL,
	[Company Name] [nvarchar](max) NULL,
	[Company Code] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_FORMULA_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_FORMULA_DS]
(
	[Production Stage Code] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Sign] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[ImEx Type] [nvarchar](max) NULL,
	[Warehouse Code] [nvarchar](max) NULL,
	[Purpose ImEx Code] [nvarchar](max) NULL,
	[Formula Code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_PAYMENT_TERM_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_PAYMENT_TERM_DS]
(
	[Payment Term Code] [nvarchar](max) NULL,
	[Payment Term Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Number of Payment] [nvarchar](max) NULL,
	[Payment Schedule 1st] [nvarchar](max) NULL,
	[Payment Schedule 2nd] [nvarchar](max) NULL,
	[Payment Schedule 3rd] [nvarchar](max) NULL,
	[Payment Schedule 4th] [nvarchar](max) NULL,
	[Payment Schedule 5th] [nvarchar](max) NULL,
	[Percentage of PS 1st] [nvarchar](max) NULL,
	[Percentage of PS 2nd] [nvarchar](max) NULL,
	[Percentage of PS 3rd] [nvarchar](max) NULL,
	[Percentage of PS 4th] [nvarchar](max) NULL,
	[Percentage of PS 5th] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_PAYMENT_TYPE_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_PAYMENT_TYPE_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Payment Type] [nvarchar](max) NULL,
	[Custumer Code] [nvarchar](max) NULL,
	[Payment Code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Bank Code] [nvarchar](max) NULL,
	[Effective Date] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_PROCESSING_PRICE_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_PROCESSING_PRICE_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Price Total 2] [nvarchar](max) NULL,
	[Price Total 3] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Price CM 2] [nvarchar](max) NULL,
	[Price CM 3] [nvarchar](max) NULL,
	[Price E 2] [nvarchar](max) NULL,
	[Price E 3] [nvarchar](max) NULL,
	[Price In 2] [nvarchar](max) NULL,
	[Price In 3] [nvarchar](max) NULL,
	[Price Other 2] [nvarchar](max) NULL,
	[Price Other 3] [nvarchar](max) NULL,
	[Price P 2] [nvarchar](max) NULL,
	[Price P 3] [nvarchar](max) NULL,
	[Price T 2] [nvarchar](max) NULL,
	[Price T 3] [nvarchar](max) NULL,
	[Price W 2] [nvarchar](max) NULL,
	[Price W3] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[Color] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_PRODUCT_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_PRODUCT_DS]
(
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Category Group] [nvarchar](max) NULL,
	[UOM] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Price FOB] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[Image URL] [nvarchar](max) NULL,
	[Contract ID] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[Item ID Ref] [nvarchar](max) NULL,
	[Class] [nvarchar](max) NULL,
	[Item Code] [nvarchar](max) NULL,
	[Customer Code] [nvarchar](max) NULL,
	[Receive Customer Code] [nvarchar](max) NULL,
	[Payment Customer Code] [nvarchar](max) NULL,
	[Category Code] [nvarchar](max) NULL,
	[SubCategory Code] [nvarchar](max) NULL,
	[Item Model] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Item Name EN] [nvarchar](max) NULL,
	[Item Name EX] [nvarchar](max) NULL,
	[Item Name VN] [nvarchar](max) NULL,
	[Category Name] [nvarchar](max) NULL,
	[SubCategory Name] [nvarchar](max) NULL,
	[SubCategory Name EN] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_PRODUCT_FACTORRY_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_PRODUCT_FACTORRY_DS]
(
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Category Group] [nvarchar](max) NULL,
	[UOM] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Price FOB] [nvarchar](max) NULL,
	[Gender] [nvarchar](max) NULL,
	[Image URL] [nvarchar](max) NULL,
	[Contract ID] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[Item ID Ref] [nvarchar](max) NULL,
	[Class] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Item Code] [nvarchar](max) NULL,
	[Customer Code] [nvarchar](max) NULL,
	[Receive Customer Code] [nvarchar](max) NULL,
	[Payment Customer Code] [nvarchar](max) NULL,
	[Category Code] [nvarchar](max) NULL,
	[SubCategory Code] [nvarchar](max) NULL,
	[Item Model] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Item Name EN] [nvarchar](max) NULL,
	[Item Name EX] [nvarchar](max) NULL,
	[Item Name VN] [nvarchar](max) NULL,
	[Category Name] [nvarchar](max) NULL,
	[SubCategory Name] [nvarchar](max) NULL,
	[SubCategory Name EN] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_PRODUCTION_STAGE_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_PRODUCTION_STAGE_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Production Stage Code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Production Stage Name] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_PURPOSE_IMEX_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_PURPOSE_IMEX_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Is Tranfer Store] [nvarchar](max) NULL,
	[Is Tranfer Item] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Purpose ImEx Name] [nvarchar](max) NULL,
	[Purpose ImEx Code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_SALE_JOURNAL_DATE_REPORT_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_SALE_JOURNAL_DATE_REPORT_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_MD_WAREHOUSE_DS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_MD_WAREHOUSE_DS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Warehouse Code] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Warehouse Name] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TGT_FACTORY_TAGRET_MONTH_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TGT_FACTORY_TAGRET_MONTH_FS]
(
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Price CM] [nvarchar](max) NULL,
	[Price E] [nvarchar](max) NULL,
	[Price Print] [nvarchar](max) NULL,
	[Price Other] [nvarchar](max) NULL,
	[Price P] [nvarchar](max) NULL,
	[Price T] [nvarchar](max) NULL,
	[Price W] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[Department Code] [nvarchar](max) NULL,
	[Production Stage Code] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
	[Plan Quantity] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TGT_PRODUCTION_TARGET_DAY_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TGT_PRODUCTION_TARGET_DAY_FS]
(
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Present Count] [nvarchar](max) NULL,
	[Employee Type] [nvarchar](max) NULL,
	[Department Code] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Word Day Of Making] [nvarchar](max) NULL,
	[Word Day Of Assistant] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
	[Work Day] [nvarchar](max) NULL,
	[Line Leader Count] [nvarchar](max) NULL,
	[Orther Employee Count] [nvarchar](max) NULL,
	[Making Employee Count] [nvarchar](max) NULL,
	[Making Employee Present] [nvarchar](max) NULL,
	[Assistant Employee Count] [nvarchar](max) NULL,
	[Assistant Employee Present] [nvarchar](max) NULL,
	[Absent Count] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[OT] [nvarchar](max) NULL,
	[OT Of Making] [nvarchar](max) NULL,
	[OT Of Assistant] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TGT_PRODUCTION_TARGET_MONTH_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TGT_PRODUCTION_TARGET_MONTH_FS]
(
	[Created Date] [nvarchar](max) NULL,
	[BEP Amount] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Amount per Day] [nvarchar](max) NULL,
	[Amount per Month] [nvarchar](max) NULL,
	[Amount 8h] [nvarchar](max) NULL,
	[Amount 9h] [nvarchar](max) NULL,
	[Amount 9h X] [nvarchar](max) NULL,
	[Extra Amount] [nvarchar](max) NULL,
	[Extra Amount X] [nvarchar](max) NULL,
	[Salary allowance] [nvarchar](max) NULL,
	[Department Code] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
	[Costing Working Day] [nvarchar](max) NULL,
	[Number of Worker] [nvarchar](max) NULL,
	[Number of Day] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Amount per Department] [nvarchar](max) NULL,
	[Extra Time] [nvarchar](max) NULL,
	[Working time 8h] [nvarchar](max) NULL,
	[Total Salary] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TGT_SALES_YEAR_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TGT_SALES_YEAR_FS]
(
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Quantity 1] [nvarchar](max) NULL,
	[Quantity 2] [nvarchar](max) NULL,
	[Quantity 3] [nvarchar](max) NULL,
	[Quantity 4] [nvarchar](max) NULL,
	[Quantity 5] [nvarchar](max) NULL,
	[Quantity 6] [nvarchar](max) NULL,
	[Quantity 7] [nvarchar](max) NULL,
	[Quantity 8] [nvarchar](max) NULL,
	[Quantity 9] [nvarchar](max) NULL,
	[Quantity 10] [nvarchar](max) NULL,
	[Quantity 11] [nvarchar](max) NULL,
	[Quantity 12] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Department Code] [nvarchar](max) NULL,
	[Customer Code] [nvarchar](max) NULL,
	[Contract Type] [nvarchar](max) NULL,
	[Row Code] [nvarchar](max) NULL,
	[Target Code] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Year] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Sum of Quantity] [nvarchar](max) NULL,
	[Sum of Amount] [nvarchar](max) NULL,
	[Amount 1] [nvarchar](max) NULL,
	[Amount 2] [nvarchar](max) NULL,
	[Amount 3] [nvarchar](max) NULL,
	[Amount 4] [nvarchar](max) NULL,
	[Amount 5] [nvarchar](max) NULL,
	[Amount 6] [nvarchar](max) NULL,
	[Amount 7] [nvarchar](max) NULL,
	[Amount 8] [nvarchar](max) NULL,
	[Amount 9] [nvarchar](max) NULL,
	[Amount 10] [nvarchar](max) NULL,
	[Amount 11] [nvarchar](max) NULL,
	[Amount 12] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_ALLOCATION_ACTUAL_TO_CONTRACT_QTY_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_ALLOCATION_ACTUAL_TO_CONTRACT_QTY_FS]
(
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[PO ID] [nvarchar](max) NULL,
	[Department Code] [nvarchar](max) NULL,
	[Production Stage Code] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
	[Quantity] [nvarchar](max) NULL,
	[Cumulative Quantity] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_FACTORY_QUANTITY_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_FACTORY_QUANTITY_FS]
(
	[Factory Code] [nvarchar](max) NULL,
	[PO ID] [nvarchar](max) NULL,
	[Plan Quantity] [nvarchar](max) NULL,
	[PO Packing Quantity Pcs] [nvarchar](max) NULL,
	[Production Stage Code] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_INVENTORY_PRODUCT_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_INVENTORY_PRODUCT_FS]
(
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[PO ID] [nvarchar](max) NULL,
	[ImEx Type] [nvarchar](max) NULL,
	[Object Code] [nvarchar](max) NULL,
	[Warehouse Code] [nvarchar](max) NULL,
	[Purpose ImEx Code] [nvarchar](max) NULL,
	[Color Code] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Voucher Date] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[Voucher No] [nvarchar](max) NULL,
	[Quantity] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_INVENTOY_ITEM_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_INVENTOY_ITEM_FS]
(
	[Voucher Type] [nvarchar](max) NULL,
	[Voucher Date] [nvarchar](max) NULL,
	[Voucher No] [nvarchar](max) NULL,
	[Line ID] [nvarchar](max) NULL,
	[Closed] [nvarchar](max) NULL,
	[Supplier Code] [nvarchar](max) NULL,
	[Place of purchase] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Payment Method] [nvarchar](max) NULL,
	[Payment Term] [nvarchar](max) NULL,
	[Payment Time] [nvarchar](max) NULL,
	[Terms of Purchase] [nvarchar](max) NULL,
	[Payment Type] [nvarchar](max) NULL,
	[Prepayme Date] [nvarchar](max) NULL,
	[Prepayment Amount] [nvarchar](max) NULL,
	[Item code] [nvarchar](max) NULL,
	[Item Name] [nvarchar](max) NULL,
	[Purchase Quantity] [nvarchar](max) NULL,
	[PurchaseUnit] [nvarchar](max) NULL,
	[Price] [nvarchar](max) NULL,
	[Amount] [nvarchar](max) NULL,
	[Conversion Factor] [nvarchar](max) NULL,
	[Warehouse Quantity] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[In Stock] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_PRODUCTION_ACTUAL_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_PRODUCTION_ACTUAL_FS]
(
	[Delete Flag] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[PO ID] [nvarchar](max) NULL,
	[PO Source] [nvarchar](max) NULL,
	[Department Code] [nvarchar](max) NULL,
	[Production Stage Code] [nvarchar](max) NULL,
	[Color Code] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Production Date] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[PO Factory] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[Quantity] [nvarchar](max) NULL,
	[Table No] [nvarchar](max) NULL,
	[Item No] [nvarchar](max) NULL,
	[Batch No] [nvarchar](max) NULL,
	[Layers Quantity] [nvarchar](max) NULL,
	[Lot No] [nvarchar](max) NULL,
	[Carton Quantity] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_PRODUCTION_PLAN_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_PRODUCTION_PLAN_FS]
(
	[Created Date] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Category Group] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[Line] [nvarchar](max) NULL,
	[Item Factory] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Day] [nvarchar](max) NULL,
	[Plan Quantity] [nvarchar](max) NULL,
	[Actual Quantity] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_PURCHASE_ORDER_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_PURCHASE_ORDER_FS]
(
	[Color Code] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Closed] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Item Name] [nvarchar](max) NULL,
	[Terms of Purchase] [nvarchar](max) NULL,
	[Payment Term] [nvarchar](max) NULL,
	[Price] [nvarchar](max) NULL,
	[PurchaseUnit] [nvarchar](max) NULL,
	[Unit] [nvarchar](max) NULL,
	[Payment Time] [nvarchar](max) NULL,
	[Conversion Factor] [nvarchar](max) NULL,
	[Payment Method] [nvarchar](max) NULL,
	[Line ID] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[In Stock] [nvarchar](max) NULL,
	[Payment Type] [nvarchar](max) NULL,
	[Voucher Type] [nvarchar](max) NULL,
	[Place of purchase] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Supplier Code] [nvarchar](max) NULL,
	[Item code] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Prepayme Date] [nvarchar](max) NULL,
	[Due Date] [nvarchar](max) NULL,
	[Voucher Date] [nvarchar](max) NULL,
	[Purchase Quantity] [nvarchar](max) NULL,
	[Warehouse Quantity] [nvarchar](max) NULL,
	[Voucher No] [nvarchar](max) NULL,
	[Prepayment Amount] [nvarchar](max) NULL,
	[Amount] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_SALES_INVOICE_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_SALES_INVOICE_FS]
(
	[Port Destination] [nvarchar](max) NULL,
	[Carton] [nvarchar](max) NULL,
	[Discount Percent] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Gate] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Terms of Delivery] [nvarchar](max) NULL,
	[Payment Term] [nvarchar](max) NULL,
	[UOM] [nvarchar](max) NULL,
	[Price CM] [nvarchar](max) NULL,
	[Price Processing] [nvarchar](max) NULL,
	[Price E] [nvarchar](max) NULL,
	[Price FOB] [nvarchar](max) NULL,
	[Price Contract] [nvarchar](max) NULL,
	[Price Print] [nvarchar](max) NULL,
	[Price Other] [nvarchar](max) NULL,
	[Price P] [nvarchar](max) NULL,
	[Price T] [nvarchar](max) NULL,
	[Price W] [nvarchar](max) NULL,
	[Gross Weight] [nvarchar](max) NULL,
	[Inspection] [nvarchar](max) NULL,
	[Payment Method] [nvarchar](max) NULL,
	[Invoice Line] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[PO ID] [nvarchar](max) NULL,
	[Price Type] [nvarchar](max) NULL,
	[Currency] [nvarchar](max) NULL,
	[Factory Code] [nvarchar](max) NULL,
	[Customer Code] [nvarchar](max) NULL,
	[Receive Customer Code] [nvarchar](max) NULL,
	[Payment Customer Code] [nvarchar](max) NULL,
	[Color Code] [nvarchar](max) NULL,
	[Bank Discount] [nvarchar](max) NULL,
	[Meas] [nvarchar](max) NULL,
	[Discount Date] [nvarchar](max) NULL,
	[Estimated Date of Discount] [nvarchar](max) NULL,
	[ETD] [nvarchar](max) NULL,
	[Invoice Date Ref] [nvarchar](max) NULL,
	[Voucher Date] [nvarchar](max) NULL,
	[Ship Run Date] [nvarchar](max) NULL,
	[Receipt Date] [nvarchar](max) NULL,
	[Bill Date] [nvarchar](max) NULL,
	[Due Date] [nvarchar](max) NULL,
	[Invoice Date] [nvarchar](max) NULL,
	[Receipt Bank] [nvarchar](max) NULL,
	[Net Weight] [nvarchar](max) NULL,
	[Estimated Discount Fee] [nvarchar](max) NULL,
	[Receipt No] [nvarchar](max) NULL,
	[Banking Fee] [nvarchar](max) NULL,
	[Transport Type] [nvarchar](max) NULL,
	[Country Destination] [nvarchar](max) NULL,
	[Quota] [nvarchar](max) NULL,
	[SIZE] [nvarchar](max) NULL,
	[Bag Quantity] [nvarchar](max) NULL,
	[Invoice Number] [nvarchar](max) NULL,
	[Invoice Number Ref] [nvarchar](max) NULL,
	[Quantity] [nvarchar](max) NULL,
	[Discount Amount] [nvarchar](max) NULL,
	[Estimated Discount Amount] [nvarchar](max) NULL,
	[Bill No] [nvarchar](max) NULL,
	[LC No] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Amount Due] [nvarchar](max) NULL,
	[Estimated Amount Due] [nvarchar](max) NULL,
	[Clearance Declaration Style] [nvarchar](max) NULL,
	[Document Amount] [nvarchar](max) NULL,
	[Invoice Status] [nvarchar](max) NULL,
	[Discount Rate] [nvarchar](max) NULL,
	[Estimated Discount Percent] [nvarchar](max) NULL,
	[Discount Status] [nvarchar](max) NULL,
	[Exchange Rate] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_SALES_ORDER_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_SALES_ORDER_FS]
(
	[Discount Percent] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Price Total] [nvarchar](max) NULL,
	[Price Total PO] [nvarchar](max) NULL,
	[Fix Shortship] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[UC] [nvarchar](max) NULL,
	[FOB Price] [nvarchar](max) NULL,
	[Price DZ] [nvarchar](max) NULL,
	[FOB Price PO] [nvarchar](max) NULL,
	[Contract ID] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[PO ID] [nvarchar](max) NULL,
	[PO number Ref] [nvarchar](max) NULL,
	[PO Status] [nvarchar](max) NULL,
	[PO Source] [nvarchar](max) NULL,
	[Division] [nvarchar](max) NULL,
	[Vendor Code] [nvarchar](max) NULL,
	[Sub Style] [nvarchar](max) NULL,
	[Style] [nvarchar](max) NULL,
	[Customer Code] [nvarchar](max) NULL,
	[Receive Customer Code] [nvarchar](max) NULL,
	[Payment Customer Code] [nvarchar](max) NULL,
	[Color Code] [nvarchar](max) NULL,
	[Hanger] [nvarchar](max) NULL,
	[Mode Price] [nvarchar](max) NULL,
	[Season] [nvarchar](max) NULL,
	[SeasonCode] [nvarchar](max) NULL,
	[PO Created Date] [nvarchar](max) NULL,
	[Customer Delivery Plan Date] [nvarchar](max) NULL,
	[TPG Delivery Plan Date] [nvarchar](max) NULL,
	[Over Ship Quantity] [nvarchar](max) NULL,
	[Country] [nvarchar](max) NULL,
	[Size] [nvarchar](max) NULL,
	[PO Packing Quantity Pcs] [nvarchar](max) NULL,
	[Quantity DZ] [nvarchar](max) NULL,
	[Quantity Pcs] [nvarchar](max) NULL,
	[Plan Quantity] [nvarchar](max) NULL,
	[PO Batch] [nvarchar](max) NULL,
	[PO Number] [nvarchar](max) NULL,
	[LC No] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Style Export] [nvarchar](max) NULL,
	[Color] [nvarchar](max) NULL,
	[Amount] [nvarchar](max) NULL,
	[Label] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_SALES_ORDER_JOURNA_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_SALES_ORDER_JOURNA_FS]
(
	[Created Date] [nvarchar](max) NULL,
	[Item ID] [nvarchar](max) NULL,
	[PO ID] [nvarchar](max) NULL,
	[Customer Delivery Plan Date] [nvarchar](max) NULL,
	[Quantity Pcs] [nvarchar](max) NULL,
	[Total] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
/****** Object:  Table [STG].[W_MRP_TRX_TPG_REPORT_YEAR_FS]    Script Date: 15/11/2021 14:36:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [STG].[W_MRP_TRX_TPG_REPORT_YEAR_FS]
(
	[Factory Code] [nvarchar](max) NULL,
	[Type Contract] [nvarchar](max) NULL,
	[Delete Flag] [nvarchar](max) NULL,
	[Date] [nvarchar](max) NULL,
	[Created Date] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL,
	[Total] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
	[Value] [nvarchar](max) NULL,
	[w_file_name] [nvarchar](max) NULL,
	[w_batch_id] [nvarchar](max) NULL,
	[w_insert_date] [nvarchar](max) NULL
)
WITH
(
	DISTRIBUTION = ROUND_ROBIN,
	HEAP
)
GO
