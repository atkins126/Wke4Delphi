unit Langji.Wke.types;

{$MINENUMSIZE 4}

interface

uses
  windows;

const
  // wkeMouseFlags
  WKE_LBUTTON = $01;
  WKE_RBUTTON = $02;
  WKE_SHIFT = $04;
  WKE_CONTROL = $08;
  WKE_MBUTTON = $10;

  // wkeKeyFlags
  WKE_EXTENDED = $0100;
  WKE_REPEAT = $4000;

  // wkeMouseMsg
  WKE_MSG_MOUSEMOVE = $0200;
  WKE_MSG_LBUTTONDOWN = $0201;
  WKE_MSG_LBUTTONUP = $0202;
  WKE_MSG_LBUTTONDBLCLK = $0203;
  WKE_MSG_RBUTTONDOWN = $0204;
  WKE_MSG_RBUTTONUP = $0205;
  WKE_MSG_RBUTTONDBLCLK = $0206;
  WKE_MSG_MBUTTONDOWN = $0207;
  WKE_MSG_MBUTTONUP = $0208;
  WKE_MSG_MBUTTONDBLCLK = $0209;
  WKE_MSG_MOUSEWHEEL = $020A;

type
  // wkeMenuItemId
  wkeMenuItemId = (
   kWkeMenuSelectedAllId = 1 shl 1,
    kWkeMenuSelectedTextId = 1 shl 2,
    kWkeMenuUndoId = 1 shl 3,
    kWkeMenuCopyImageId = 1 shl 4,
    kWkeMenuInspectElementAtId = 1 shl 5,
    kWkeMenuCutId = 1 shl 6,
    kWkeMenuPasteId = 1 shl 7,
    kWkeMenuPrintId = 1 shl 8,
    kWkeMenuGoForwardId = 1 shl 9,
    kWkeMenuGoBackId = 1 shl 10,
    kWkeMenuReloadId = 1 shl 11,
    kWkeMenuSaveImageId = 1 shl 12
  );


  // WKE_SETTING_PAINTCALLBACK_IN_OTHER_THREAD=4;

type
  utf8 = AnsiChar;

  Putf8 = PAnsiChar;

  wchar_t = WideChar;

  Pwchar_t = PWideChar;

  jsValue = int64;

  PjsValue = PInt64;

  wkeString = Pointer;

  wkeFrameHwnd = Pointer;

  wkeNetJob = Pointer;

  wkeProxyType = (WKE_PROXY_NONE, WKE_PROXY_HTTP, WKE_PROXY_SOCKS4, WKE_PROXY_SOCKS4A, WKE_PROXY_SOCKS5, WKE_PROXY_SOCKS5HOSTNAME);

  TwkeProxyType = wkeProxyType;

  wkeSettingMask = (WKE_SETTING_PROXY = 1, WKE_SETTING_PAINTCALLBACK_IN_OTHER_THREAD = 4);

  TwkeSettingMask = wkeSettingMask;

  wkeNavigationType = (WKE_NAVIGATION_TYPE_LINKCLICK, WKE_NAVIGATION_TYPE_FORMSUBMITTE, WKE_NAVIGATION_TYPE_BACKFORWARD,
    WKE_NAVIGATION_TYPE_RELOAD, WKE_NAVIGATION_TYPE_FORMRESUBMITT, WKE_NAVIGATION_TYPE_OTHER);

  TwkeNavigationType = wkeNavigationType;

  wkeLoadingResult = (WKE_LOADING_SUCCEEDED, WKE_LOADING_FAILED, WKE_LOADING_CANCELED);

  TwkeLoadingResult = wkeLoadingResult;

  wkeCookieCommand = (wkeCookieCommandClearAllCookies, wkeCookieCommandClearSessionCookies,
    wkeCookieCommandFlushCookiesToFile, wkeCookieCommandReloadCookiesFromFile);

  wkeWindowType = (WKE_WINDOW_TYPE_POPUP, WKE_WINDOW_TYPE_TRANSPARENT, WKE_WINDOW_TYPE_CONTROL);

  TwkeWindowType = wkeWindowType;

  jsType = (JSTYPE_NUMBER, JSTYPE_STRING, JSTYPE_BOOLEAN, JSTYPE_OBJECT, JSTYPE_FUNCTION, JSTYPE_UNDEFINED);

  TjsType = jsType;

  wkeRect = packed record
    x: Integer;
    y: Integer;
    w: Integer;
    h: Integer;
  end;

  PwkeRect = ^TwkeRect;

  TwkeRect = wkeRect;

  // typedef struct _wkeProxy {
  // wkeProxyType type;
  // char hostname[100];
  // unsigned short port;
  // char username[50];
  // char password[50];
  // } wkeProxy;

  wkeProxy = packed record
    AType: wkeProxyType;
    hostname: array[0..99] of AnsiChar;
    port: Word;
    username: array[0..49] of AnsiChar;
    password: array[0..49] of AnsiChar;
  end;

  PwkeProxy = ^TwkeProxy;

  TwkeProxy = wkeProxy;

  wkeSettings = packed record
    proxy: wkeProxy;
    mask: Longint;
  end;

  PwkeSettings = ^TwkeSettings;

  TwkeSettings = wkeSettings;

  wkeWindowFeatures = packed record
    x: Integer;
    y: Integer;
    width: Integer;
    height: Integer;
    menuBarVisible: Boolean;
    statusBarVisible: Boolean;
    toolBarVisible: Boolean;
    locationBarVisible: Boolean;
    scrollbarsVisible: Boolean;
    resizable: Boolean;
    fullscreen: Boolean;
    dialog: Boolean;
  end;

  PwkeWindowFeatures = ^TwkeWindowFeatures;

  TwkeWindowFeatures = wkeWindowFeatures;

  wkeMessageLevel = (WKE_MESSAGE_LEVEL_TIP, WKE_MESSAGE_LEVEL_LOG, WKE_MESSAGE_LEVEL_WARNING, WKE_MESSAGE_LEVEL_ERROR, WKE_MESSAGE_LEVEL_DEBUG);

  wkeMessageSource = (WKE_MESSAGE_SOURCE_HTML, WKE_MESSAGE_SOURCE_XML, WKE_MESSAGE_SOURCE_JS, WKE_MESSAGE_SOURCE_NETWORK,
    WKE_MESSAGE_SOURCE_CONSOLE_API, WKE_MESSAGE_SOURCE_OTHER);

  wkeMessageType = (WKE_MESSAGE_TYPE_LOG, WKE_MESSAGE_TYPE_DIR, WKE_MESSAGE_TYPE_DIR_XML, WKE_MESSAGE_TYPE_TRACE,
    WKE_MESSAGE_TYPE_START_GROUP, WKE_MESSAGE_TYPE_START_GROUP_COLLAPSED, WKE_MESSAGE_TYPE_END_GROUP, WKE_MESSAGE_TYPE_ASSERT);

  PwkeConsoleMessage = ^wkeConsoleMessage;

  wkeConsoleMessage = packed record
    source: wkeMessageSource;
    type_: wkeMessageType;
    level: wkeMessageLevel;
    message_: wkeString;
    url: wkeString;
    lineNumber: Longint;
  end;

  // Add 20180523
  pwkeMemBuf = packed record
    size: Integer;
    data: Pointer;
    length: Cardinal;
  end;

  wkeHttBodyElementType = (wkeHttBodyElementTypeData, wkeHttBodyElementTypeFile);

  wkePostBodyElement = packed record
    size: Integer;
    type_: wkeHttBodyElementType;
    data: pwkeMemBuf;
    filepath: wkeString;
    filestart: int64;
    filelength: int64;
  end;

  pwkePostBodyElement = ^wkePostBodyElement;

  // typedef enum _wkeRequestType {
  // kWkeRequestTypeInvalidation,
  // kWkeRequestTypeGet,
  // kWkeRequestTypePost,
  // kWkeRequestTypePut,
  // } wkeRequestType;

  wkeRequestType = (kWkeRequestTypeInvalidation, kWkeRequestTypeGet, kWkeRequestTypePost, kWkeRequestTypePut);

  wkeDownloadOpt = (kWkeDownloadOptCancel, kWkeDownloadOptCacheData);

  wkeNetJobDataRecvCallback = procedure(ptr: Pointer; job: wkeNetJob; const data: PAnsiChar; length: Integer); cdecl;
  wkeNetJobDataFinishCallback = procedure(ptr: Pointer; job: wkeNetJob; result: wkeLoadingResult); cdecl;

  wkeNetJobDataBind = packed record
    param: Pointer;
    recvCallback: wkeNetJobDataRecvCallback;
    finishCallback:wkeNetJobDataFinishCallback;
  end;
  pwkeNetJobDataBind = ^wkeNetJobDataBind;

  // typedef struct _wkeWindowCreateInfo {
  // int size;
  // HWND parent;
  // DWORD style;
  // DWORD styleEx;
  // int x;
  // int y;
  // int width;
  // int height;
  // COLORREF color;

  wkeWindowCreateInfo = packed record
    size: Integer;
    parent: HWND;
    style: DWORD;
    styleex: DWORD;
    x, y, width, height: Integer;
    color: TColorRef;
  end;

  pwkeWindowCreateInfo = ^wkeWindowCreateInfo;


  // typedef struct _wkePostBodyElements {
  // int size;
  // wkePostBodyElement** element;
  // size_t elementSize;
  // bool isDirty;
  // } wkePostBodyElements;

  TwkePostBodyElements = packed record
    size: Integer;
    element: pwkePostBodyElement;
    elementSize: Cardinal;
    isDirty: Boolean;
  end;

  pwkePostBodyElements = ^TwkePostBodyElements;

{$IF not Declared(SIZE_T)}
  SIZE_T = Cardinal;
{$IFEND}
  // typedef void* (*FILE_OPEN) (const char* path);

  FILE_OPEN = function(path: PAnsiChar): Pointer; cdecl;
  // typedef void (*FILE_CLOSE) (void* handle);

  FILE_CLOSE = procedure(handle: Pointer); cdecl;
  // typedef size_t (*FILE_SIZE) (void* handle);

  FILE_SIZE = function(handle: Pointer): SIZE_T; cdecl;
  // typedef int (*FILE_READ) (void* handle, void* buffer, size_t size);

  FILE_READ = function(handle: Pointer; buffer: Pointer; size: SIZE_T): Integer; cdecl;
  // typedef int (*FILE_SEEK) (void* handle, int offset, int origin);

  FILE_SEEK = function(handle: Pointer; offset, origin: Integer): Integer; cdecl;

  wkeWebView = Pointer;

  TwkeWebView = wkeWebView;

  JScript = class;

  jsExecState = JScript;


  // typedef bool(WKE_CALL_TYPE * wkeCookieVisitor)(
  // void* params,
  // const char* name,
  // const char* value,
  // const char* domain,
  // const char* path, // If |path| is non-empty only URLs at or below the path will get the cookie value.
  // int secure, // If |secure| is true the cookie will only be sent for HTTPS requests.
  // int httpOnly, // If |httponly| is true the cookie will only be sent for HTTP requests.
  // int* expires // The cookie expiration date is only valid if |has_expires| is true.
  // );

  wkeCookieVisitor = function(params: Pointer; const name, value, domain, path: PAnsiChar; secure, httpOnly: Integer;
    expires: PInteger): Boolean; cdecl;

  wkeTitleChangedCallback = procedure(webView: wkeWebView; param: Pointer; title: wkeString); cdecl;

  wkeURLChangedCallback = procedure(webView: wkeWebView; param: Pointer; url: wkeString); cdecl;

  wkeURLChangedCallback2 = procedure(webView: wkeWebView; param: Pointer; frameid: wkeFrameHwnd; url: wkeString); cdecl;
  // 2018.02.07

  wkePaintUpdatedCallback = procedure(webView: wkeWebView; param: Pointer; hdc: hdc; x: Integer; y: Integer; cx: Integer; cy: Integer); cdecl;

  wkeAlertBoxCallback = procedure(webView: wkeWebView; param: Pointer; msg: wkeString); cdecl;

  wkeConfirmBoxCallback = function(webView: wkeWebView; param: Pointer; msg: wkeString): Boolean; cdecl;

  wkePromptBoxCallback = function(webView: wkeWebView; param: Pointer; msg: wkeString; defaultResult: wkeString; sresult: wkeString): Boolean; cdecl;

  wkeNavigationCallback = function(webView: wkeWebView; param: Pointer; navigationType: wkeNavigationType; url: wkeString): Boolean; cdecl;

  wkeCreateViewCallback = function(webView: wkeWebView; param: Pointer; navigationType: wkeNavigationType; url:
    wkeString; windowFeatures: PwkeWindowFeatures): wkeWebView; cdecl;

  wkeDocumentReadyCallback = procedure(webView: wkeWebView; param: Pointer); cdecl;

  wkeDocumentReadyCallback2 = procedure(webView: wkeWebView; param: Pointer; frameid: wkeFrameHwnd); cdecl; // 2018.02.07

  wkeLoadingFinishCallback = procedure(webView: wkeWebView; param: Pointer; url: wkeString; result: wkeLoadingResult; failedReason: wkeString); cdecl;

  wkeWindowClosingCallback = function(webWindow: wkeWebView; param: Pointer): Boolean; cdecl;

  wkeWindowDestroyCallback = procedure(webWindow: wkeWebView; param: Pointer); cdecl;

  // wkeWebView webView, void* param, wkeConsoleLevel level, const wkeString message, const wkeString sourceName, unsigned sourceLine, const wkeString stackTrace);
  wkeConsoleMessageCallback = procedure(webView: wkeWebView; param: Pointer; level: wkeMessageLevel; const AMessage,
    sourceName: wkeString; sourceLine: Cardinal; const stackTrack: wkeString); cdecl;

  // typedef bool(*wkeLoadUrlBeginCallback)(wkeWebView webView, void* param, const char *url, void *job);
  // typedef void(*wkeLoadUrlEndCallback)(wkeWebView webView, void* param, const char *url, void *job, void* buf, int len);
  // typedef void(*wkeDidCreateScriptContextCallback)(wkeWebView webView, void* param, wkeWebFrameHandle frameId, void* context, int extensionGroup, int worldId);
  // typedef void(*wkeWillReleaseScriptContextCallback)(wkeWebView webView, void* param, wkeWebFrameHandle frameId, void* context, int worldId);
  // typedef bool(*wkeNetResponseCallback)(wkeWebView webView, void* param, const char* url, void* job);
  // typedef bool(*wkeDownloadCallback)(wkeWebView webView, void* param, const char* url);
  wkeDownloadCallback = function(webView: wkeWebView; param: Pointer; url: PAnsiChar): Boolean; cdecl; // wkeString): boolean;

  wkeDownload2Callback = function(webView: wkeWebView; param: Pointer; expectedContentLength: Integer; const url, mime, disposition: PAnsiChar;
    job:wkeNetJob; dataBind: pwkeNetJobDataBind): wkeDownloadOpt; cdecl; // wkeString): boolean;

  wkeOnCallUiThread = procedure(webView: wkeWebView; paramOnInThread: Pointer); cdecl; // 2018.02.07

  wkeCallUiThread = procedure(webView: wkeWebView; func: wkeOnCallUiThread; param: Pointer); cdecl; // 2018.02.07

  wkeLoadUrlBeginCallback = function(webView: wkeWebView; param: Pointer; url: PAnsiChar; job: Pointer): Boolean; cdecl;
  // 2018.02.07

  wkeLoadUrlEndCallback = procedure(webView: wkeWebView; param: Pointer; const url: PAnsiChar; job: Pointer; buf:
    Pointer; len: Integer); cdecl;
  // 2018.02.07

  wkeLoadUrlFailCallback = procedure(webView: wkeWebView; param: Pointer; const url: PAnsiChar; job: Pointer); cdecl;

  wkeNetResponseCallback = function(webView: wkeWebView; param: Pointer; url: wkeString; job: Pointer): Boolean; cdecl; // 2018.02.07

  jsGetPropertyCallback = function(es: jsExecState; AObject: jsValue; propertyName: PAnsiChar): jsValue; cdecl;

  jsSetPropertyCallback = function(es: jsExecState; AObject: jsValue; propertyName: PAnsiChar; value: jsValue): Boolean; cdecl;

  jsCallAsFunctionCallback = function(es: jsExecState; AObject: jsValue; args: PjsValue; argCount: Integer): jsValue; cdecl;

  PjsData = ^TjsData;

  jsFinalizeCallback = procedure(data: PjsData); cdecl;

  jsData = packed record
    typeName: array[0..99] of AnsiChar; // char
    propertyGet: jsGetPropertyCallback;
    propertySet: jsSetPropertyCallback;
    finalize: jsFinalizeCallback;
    callAsFunction: jsCallAsFunctionCallback;
  end;

  TjsData = jsData;
  // #define JS_CALL __fastcall
  // typedef jsValue (JS_CALL *jsNativeFunction) (jsExecState es);
  // ����������д��������vc __fastcall��Լ����delphi registerԼ���Ĳ�һ��
{$IFDEF UseVcFastCall}

  jsNativeFunction = function(es: jsExecState): jsValue;
{$ELSE}
  // ǰ������������ռλ��

  jsNativeFunction = function(p1, p2, es: jsExecState): jsValue;
{$ENDIF}

  TNewWindowFlag = (nwf_NewPage, nwf_OpenInCurrent, nwf_Cancel);

  TwkePlatform = (wp_Win32, wp_Android, wp_Ios);

  // �߼��ļ��������ӿ�
  IFileDownloader = interface
    ['{D04619E6-0827-43E0-8602-C2B8848DD29D}']
    function OnRecvData(const data: Pointer; nLen: Int64): Boolean;
    procedure OnFinish(eResult: TwkeLoadingResult);
  end;

  // �¼�����
  TOnTitleChangeEvent = procedure(Sender: TObject; sTitle: string) of object;

  TOnUrlChangeEvent = procedure(Sender: TObject; sUrl: string) of object;

  TOnLoadEndEvent = procedure(Sender: TObject; sUrl: string; loadresult: wkeLoadingResult) of object;

  TOnBeforeLoadEvent = procedure(Sender: TObject; sUrl: string; navigationType: wkeNavigationType; var Cancel: Boolean) of object;

  TOnCreateViewEvent = procedure(Sender: TObject; sUrl: string; navigationType: wkeNavigationType; windowFeatures:
    PwkeWindowFeatures; var wvw: wkeWebView) of object;

  TOnAlertBoxEvent = procedure(Sender: TObject; sMsg: string) of object;

  TOnConfirmBoxEvent = procedure(Sender: TObject; sMsg: string; var bresult: Boolean) of object;

  TOnPromptBoxEvent = procedure(Sender: TObject; sMsg, defaultres, Strres: string; var bresult: Boolean) of object;

  TOnDownloadEvent = procedure(Sender: TObject; sUrl: string) of object;

  TOnDownload2Event = procedure(Sender: TObject; sUrl: string; sFileName: string; var Handler: IFileDownloader) of object;

  TOnConsoleMessgeEvent = procedure(Sender: TObject; const sMsg, source: string; const sline: Integer) of object;

  TOnLoadUrlEndEvent = procedure(Sender: TObject; sUrl: string; job, buf: Pointer; len: Integer) of object;

  TOnLoadUrlFailEvent = procedure(Sender: TObject; sUrl: string; job: Pointer) of object;

  TOnLoadUrlBeginEvent = procedure(Sender: TObject; sUrl: string; job: Pointer; out bHook, bHandled: Boolean) of object;



//------------------------------------------------------------------------------
// Js
//------------------------------------------------------------------------------

  JScript = class
  public
    class procedure BindFunction(const AName: string; fn: jsNativeFunction; AArgCount: LongInt); {$IFDEF SupportInline}inline;{$ENDIF}
    class procedure BindGetter(const AName: string; fn: jsNativeFunction); {$IFDEF SupportInline}inline;{$ENDIF}
    class procedure BindSetter(const AName: string; fn: jsNativeFunction); {$IFDEF SupportInline}inline;{$ENDIF}
    function ArgCount: Integer; {$IFDEF SupportInline}inline;{$ENDIF}
    function ArgType(argIdx: Integer): jsType; {$IFDEF SupportInline}inline;{$ENDIF}
    function Arg(argIdx: Integer): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    class function TypeOf(v: jsValue): jsType; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsNumber(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsString(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsBoolean(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsObject(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsFunction(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsUndefined(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsNull(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsArray(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsTrue(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    class function IsFalse(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    function ToInt(v: jsValue): Integer; {$IFDEF SupportInline}inline;{$ENDIF}
    function ToFloat(v: jsValue): Single; {$IFDEF SupportInline}inline;{$ENDIF}
    function ToDouble(v: jsValue): Double; {$IFDEF SupportInline}inline;{$ENDIF}
    function ToBoolean(v: jsValue): Boolean; {$IFDEF SupportInline}inline;{$ENDIF}
    function ToTempString(v: jsValue): string; {$IFDEF SupportInline}inline;{$ENDIF}
    class function Int(n: Integer): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    class function Float(f: Single): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    class function Double(d: Double): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    class function Boolean(b: Boolean): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    class function Undefined: jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    class function Null: jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    class function True_: jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    class function False_: jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function String_(const AStr: string): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function EmptyObject: jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function EmptyArray: jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function Object_(obj: PjsData): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function Function_(obj: PjsData): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function GetData(AObject: jsValue): PjsData;
    function Get(AObject: jsValue; const prop: string): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    procedure Set_(AObject: jsValue; const prop: string; v: jsValue); {$IFDEF SupportInline}inline;{$ENDIF}
    function GetAt(AObject: jsValue; index: Integer): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    procedure SetAt(AObject: jsValue; index: Integer; v: jsValue); {$IFDEF SupportInline}inline;{$ENDIF}
    function GetLength(AObject: jsValue): Integer; {$IFDEF SupportInline}inline;{$ENDIF}
    procedure SetLength(AObject: jsValue; length: Integer); {$IFDEF SupportInline}inline;{$ENDIF}
    function GlobalObject: jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function GetWebView: wkeWebView; {$IFDEF SupportInline}inline;{$ENDIF}
    function Eval(const AStr: string): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function Call(func: jsValue; thisObject: jsValue; args: PjsValue; argCount: Integer): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function CallGlobal(func: jsValue; args: PjsValue; argCount: Integer): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    function GetGlobal(const prop: string): jsValue; {$IFDEF SupportInline}inline;{$ENDIF}
    procedure SetGlobal(const prop: string; v: jsValue); {$IFDEF SupportInline}inline;{$ENDIF}
    class procedure GC; {$IFDEF SupportInline}inline;{$ENDIF}
  end;

implementation

   uses Langji.Wke.lib;

{ JScript }

class procedure JScript.BindFunction(const AName: string; fn: jsNativeFunction; AArgCount: LongInt);
begin
  jsBindFunction(PAnsiChar(AnsiString({$IFDEF FPC}Utf8ToAnsi(AName){$ELSE}AName{$ENDIF})), fn, AArgCount);
end;

class procedure JScript.BindGetter(const AName: string; fn: jsNativeFunction);
begin
  jsBindGetter(PAnsiChar(AnsiString({$IFDEF FPC}Utf8ToAnsi(AName){$ELSE}AName{$ENDIF})), fn);
end;

class procedure JScript.BindSetter(const AName: string; fn: jsNativeFunction);
begin
  jsBindSetter(PAnsiChar(AnsiString({$IFDEF FPC}Utf8ToAnsi(AName){$ELSE}AName{$ENDIF})), fn);
end;

function JScript.ArgCount: Integer;
begin
  Result := jsArgCount(Self);
end;

function JScript.ArgType(argIdx: Integer): jsType;
begin
  Result := jsArgType(Self, argIdx);
end;

function JScript.Arg(argIdx: Integer): jsValue;
begin
  Result := jsArg(Self, argIdx);
end;

class function JScript.TypeOf(v: jsValue): jsType;
begin
  Result := jsTypeOf(v);
end;

class function JScript.IsNumber(v: jsValue): Boolean;
begin
  Result := jsIsNumber(v);
end;

class function JScript.IsString(v: jsValue): Boolean;
begin
  Result := jsIsString(v);
end;

class function JScript.IsBoolean(v: jsValue): Boolean;
begin
  Result := jsIsBoolean(v);
end;

class function JScript.IsObject(v: jsValue): Boolean;
begin
  Result := jsIsObject(v);
end;

class function JScript.IsFunction(v: jsValue): Boolean;
begin
  Result := jsIsFunction(v);
end;

class function JScript.IsUndefined(v: jsValue): Boolean;
begin
  Result := jsIsUndefined(v);
end;

class function JScript.IsNull(v: jsValue): Boolean;
begin
  Result := jsIsNull(v);
end;

class function JScript.IsArray(v: jsValue): Boolean;
begin
  Result := jsIsArray(v);
end;

class function JScript.IsTrue(v: jsValue): Boolean;
begin
  Result := jsIsTrue(v);
end;

class function JScript.IsFalse(v: jsValue): Boolean;
begin
  Result := jsIsFalse(v);
end;

function JScript.ToInt(v: jsValue): Integer;
begin
  Result := jsToInt(Self, v);
end;

function JScript.ToFloat(v: jsValue): Single;
begin
  Result := jsToFloat(Self, v);
end;

function JScript.ToDouble(v: jsValue): Double;
begin
  Result := jsToDouble(Self, v);
end;

function JScript.ToBoolean(v: jsValue): Boolean;
begin
  Result := jsToBoolean(Self, v);
end;

function JScript.ToTempString(v: jsValue): string;
begin
{$IFDEF UNICODE}
  Result := jsToTempStringW(Self, v);
{$ELSE}
  Result := {$IFDEF FPC}jsToTempString(Self, v){$ELSE}Utf8ToAnsi(jsToTempString(Self, v)){$ENDIF};
{$ENDIF}
end;

class function JScript.Int(n: Integer): jsValue;
begin
  Result := jsInt(n);
end;

class function JScript.Float(f: Single): jsValue;
begin
  Result := jsFloat(f);
end;

class function JScript.Double(d: Double): jsValue;
begin
  Result := jsDouble(d);
end;

class function JScript.Boolean(b: Boolean): jsValue;
begin
  Result := jsBoolean(b);
end;

class function JScript.Undefined: jsValue;
begin
  Result := jsUndefined;
end;

class function JScript.Null: jsValue;
begin
  Result := jsNull;
end;

class function JScript.True_: jsValue;
begin
  Result := jsTrue;
end;

class function JScript.False_: jsValue;
begin
  Result := jsFalse;
end;

function JScript.String_(const AStr: string): jsValue;
begin
{$IFDEF UNICODE}
  Result := jsStringW(Self, PChar(AStr));
{$ELSE}
  Result := jsString(Self, PChar({$IFDEF FPC}AStr{$ELSE}AnsiToUtf8(AStr){$ENDIF}));
{$ENDIF}
end;

function JScript.EmptyObject: jsValue;
begin
  Result := jsEmptyObject(Self);
end;

function JScript.EmptyArray: jsValue;
begin
  Result := jsEmptyArray(Self);
end;

function JScript.Object_(obj: PjsData): jsValue;
begin
  Result := jsObject(Self, obj);
end;

function JScript.Function_(obj: PjsData): jsValue;
begin
  Result := jsFunction(Self, obj);
end;

function JScript.GetData(AObject: jsValue): PjsData;
begin
  Result := jsGetData(Self, AObject);
end;

function JScript.Get(AObject: jsValue; const prop: string): jsValue;
begin
  Result := jsGet(Self, AObject, PAnsiChar(AnsiString({$IFDEF FPC}Utf8ToAnsi(prop){$ELSE}prop{$ENDIF})));
end;

procedure JScript.Set_(AObject: jsValue; const prop: string; v: jsValue);
begin
  jsSet(Self, AObject, PAnsiChar(AnsiString({$IFDEF FPC}Utf8ToAnsi(prop){$ELSE}prop{$ENDIF})), v);
end;

function JScript.GetAt(AObject: jsValue; index: Integer): jsValue;
begin
  Result := jsGetAt(Self, AObject, index);
end;

procedure JScript.SetAt(AObject: jsValue; index: Integer; v: jsValue);
begin
  jsSetAt(Self, AObject, index, v);
end;

function JScript.GetLength(AObject: jsValue): Integer;
begin
  Result := jsGetLength(Self, AObject);
end;

procedure JScript.SetLength(AObject: jsValue; length: Integer);
begin
  jsSetLength(Self, AObject, length);
end;

function JScript.GlobalObject: jsValue;
begin
  Result := jsGlobalObject(Self);
end;

function JScript.GetWebView: wkeWebView;
begin
  Result := jsGetWebView(Self);
end;

function JScript.Eval(const AStr: string): jsValue;
begin
{$IFDEF UNICODE}
  Result := jsEvalW(Self, PChar(AStr));
{$ELSE}
  Result := jsEval(Self, PChar({$IFDEF FPC}AStr{$ELSE}AnsiToUtf8(AStr){$ENDIF}));
{$ENDIF}
end;

function JScript.Call(func: jsValue; thisObject: jsValue; args: PjsValue; argCount: Integer): jsValue;
begin
  Result := jsCall(Self, func, thisObject, args, argCount);
end;

function JScript.CallGlobal(func: jsValue; args: PjsValue; argCount: Integer): jsValue;
begin
  Result := jsCallGlobal(Self, func, args, argCount);
end;

function JScript.GetGlobal(const prop: string): jsValue;
begin
  Result := jsGetGlobal(Self, PAnsiChar(AnsiString({$IFDEF FPC}Utf8ToAnsi(prop){$ELSE}prop{$ENDIF})));
end;

procedure JScript.SetGlobal(const prop: string; v: jsValue);
begin
  jsSetGlobal(Self, PAnsiChar(AnsiString({$IFDEF FPC}Utf8ToAnsi(prop){$ELSE}prop{$ENDIF})), v);
end;

class procedure JScript.GC;
begin
  jsGC;
end;


end.

