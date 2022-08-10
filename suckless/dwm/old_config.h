/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 20;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 30;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "hack:size=12" };
static const char col_orange[]      = "#d19965";
static const char col_fg[]          = "#abb2c0";
static const char col_bg[]          = "#272b33";
static const unsigned int baralpha = 0xd0;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_fg, col_bg, col_orange },
	[SchemeSel]  = { col_bg, col_orange,  col_orange },
};
static const unsigned int alphas[][3]      = {
	/*               fg      bg        border     */
	[SchemeNorm] = { OPAQUE, baralpha, borderalpha },
	[SchemeSel]  = { OPAQUE, baralpha, borderalpha },
};

typedef struct {
	const char *name;
	const void *cmd;
} Sp;
const char *spcmd1[] = {"st", "-n", "spterm", "-g", "200x60", NULL };
const char *spcmd2[] = {"st", "-n", "bpytop", "-g", "200x60", "-e", "bpytop", NULL };
const char *spcmd3[] = {"st", "-n", "ncspot", "-g", "200x60"  "-e", "ncspot",  NULL };
const char *spcmd4[] = {"st", "-n", "mutt", "-g", "200x60"  "-e", "mutt",  NULL };
const char *spcmd5[] = {"st", "-n", "calcurse", "-g", "200x60"  "-e", "calcurse",  NULL };
const char *spcmd6[] = {"st", "-n", "pulsemixer", "-g", "200x60"  "-e", "pulsemixer",  NULL };
static Sp scratchpads[] = {
	/* name          cmd  */
	{"spterm",      spcmd1},
	{"bpytop",      spcmd2},
	{"ncspot",      spcmd3},
	{"mutt",        spcmd4},
	{"calcurse",    spcmd5},
	{"pulsemixer",  spcmd6},
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance     title  tags       mask     isfloating   monitor */
	{ "Gimp", 	  NULL,        NULL,  0,         1,   -1 },
	{ "Firefox",  NULL,        NULL,  1 << 8,    0,   -1 },
	{ NULL,       "spterm",    NULL,  SPTAG(0),  1,   -1 },
	{ NULL,       "bpytop",    NULL,  SPTAG(1),  1,   -1 },
	{ NULL,       "ncspot",    NULL,  SPTAG(2),  1,   -1 },
	{ NULL,       "mutt",      NULL,  SPTAG(3),  1,   -1 },
	{ NULL,       "calcurse",  NULL,  SPTAG(4),  1,   -1 },
	{ NULL,       "pulsemixer",NULL,  SPTAG(5),  1,   -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#define FORCE_VSPLIT 1
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "TTT",      bstack },
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[@]",      spiral },
	{ "[\\]",     dwindle },
	{ "H[]",      deck },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#define STATUSBAR "dwmblocks"

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "rofi-application-launcher", NULL};
static const char *termcmd[]  = { "st", NULL };
static const char *browser[]  = { "google-chrome-stable", NULL };
static const char *powermenu[]  = { "rofi-powermenu", NULL };

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

#include <X11/XF86keysym.h>
#include "shiftview.c"

static Key keys[] = {
	/* modifier                     key        function        argument */
	/* Layout related commands */
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_equal,  incrgaps,       {.i = +1 } },
	{ MODKEY,                       XK_minus,  incrgaps,       {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_equal,  togglegaps,     {0} },
	{ MODKEY|ShiftMask,             XK_minus,  defaultgaps,    {0} },
	{ MODKEY,                 XK_bracketright, incnmaster,     {.i = +1 } },
	{ MODKEY,                 XK_bracketleft,  incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_u,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_i,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY,                       XK_n,      shiftview,      {.i = -1} },
	{ MODKEY,                       XK_m,      shiftview,      {.i = +1} },
	{ MODKEY|ShiftMask,             XK_f,      togglefloating, {0} },
	{ MODKEY,                       XK_o,      togglefullscr,  {0} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|ShiftMask,         XK_BackSpace,  spawn,          {.v = powermenu} },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	/* Spawning program related commands */
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_f,      spawn,          {.v = browser } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_grave,  togglescratch,  {.ui = 0 } },
	{ MODKEY,                       XK_F2,     togglescratch,  {.ui = 1 } },
	{ MODKEY,                       XK_s,      togglescratch,  {.ui = 2 } },
	{ MODKEY,                       XK_a,      togglescratch,  {.ui = 3 } },
	{ MODKEY,                       XK_z,      togglescratch,  {.ui = 4 } },
	{ MODKEY,                       XK_F1,     togglescratch,  {.ui = 5 } },
	{ MODKEY,                       XK_w,      killclient,     {0} },
	/* Audoio buttons */
	{ 0, XF86XK_AudioMute,          spawn,    SHCMD("pamixer -t; kill -35 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioRaiseVolume,   spawn,    SHCMD("pamixer --allow-boost -i 3; kill -35 $(pidof dwmblocks)") },
	{ 0, XF86XK_AudioLowerVolume,   spawn,    SHCMD("pamixer --allow-boost -d 3; kill -35 $(pidof dwmblocks)") },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button1,        sigstatusbar,   {.i = 1} },
	{ ClkStatusText,        0,              Button2,        sigstatusbar,   {.i = 2} },
	{ ClkStatusText,        0,              Button3,        sigstatusbar,   {.i = 3} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button1,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

