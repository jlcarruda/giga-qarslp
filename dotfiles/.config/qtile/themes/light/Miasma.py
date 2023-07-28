# _______  _______  ______  _______  __        
#|       ||   _   ||   __ \|     __||  |.-----.
#|   -  _||       ||      <|__     ||  ||  _  |
#|_______||___|___||___|__||_______||__||   __|
#                                       |__|   
# SpectrumOS - Embrace the Chromatic Symphony!
# By: gibranlp <thisdoesnotwork@gibranlp.dev>
# MIT licence
from functions import *
# Theme
## Screens

def init_widgets_list():
    widgets_list = [
           widget.TextBox(
              foreground=color[1],
              background=color[0],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.CurrentLayout(
              use_mask=True,
              background=color[1],
              foreground=color[0],
              scale=0.8,
            ),
            widget.TextBox(
              foreground=color[2],
              background=color[1],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.CPU(
              foreground=color[0],
              background=color[2],
              format='{load_percent}%'
            ),
            widget.TextBox(
              foreground=color[4],
              background=color[2],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.WindowName(
              background=color[4],
              foreground=color[0],
              width=widget_width,
              format='{state} {name}',
              scroll=True,
              scroll_delay=2,
              scroll_repeat=True,
              scroll_step=1,
            ),
            widget.TextBox(
              foreground=color[6],
              background=color[4],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.Mpris2(
              background=color[6],
              mouse_callbacks={'Button1': lambda: qtile.spawn(terminal  + " -e cava")},
              objname=None,
              foreground=color[0],
              width=widget_width,
              format='{xesam:artist}  {xesam:title}',
              stopped_text="Stop",
              paused_text='  ',
              scroll=True,
              scroll_repeat=True,
              scroll_delay=0.1,
            ),
            widget.TextBox(
              foreground=color[8],
              background=color[6],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.Pomodoro(
              background=color[8],
              foreground=color[0],
              color_active=color[0],
              color_break=color[0],
              color_inactive=color[0],
              length_long_break=30,
              length_pomodori=45,
              length_short_break=15,
              notification_on=True,
              num_pomodori=3,
              prefix_active=' ',
              prefix_inactive='',
              prefix_break=' ',
              prefix_long_break=' ',
              prefix_paused=' ',
            ),
            widget.TextBox(
              foreground=color[0],
              background=color[6],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.Prompt(
              background=color[0],
              prompt=prompt,
              foreground=color[4],
              cursor_color=color[4],
              visual_bell_color=[4],
              visual_bell_time=0.2,
            ),
            widget.Spacer(
              length=bar.STRETCH,
              background=transparent,
            ),
            widget.TextBox(
              foreground=secondary_color[4],
              background=color[0],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.GroupBox(
              background=secondary_color[4],
              fontsize=groups_font,
              font=awesome_font,
              disable_drag=True,
              hide_unused=hide_unused_groups,
              borderwidth=0,
              active=secondary_color[0], #Program opened in that group
              inactive=secondary_color[8], # Empty Group
              rounded=False,
              highlight_method="text",
              this_current_screen_border=color[0],
              center_aligned = True,
              other_curren_screen_border=color[0],
              block_highlight_text_color=color[0],    
              urgent_border="fc0000",
              #visible_groups=['Escape','1','2','3','4'],
            ),
            widget.TextBox(
              foreground=secondary_color[4],
              background=color[0],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.Spacer(
              length=bar.STRETCH,
              background=transparent,
            ),
            widget.UPowerWidget(
               border_charge_colour=color[3],
               border_colour=secondary_color[0],
               border_critical_colour='#cc0000',
               fill_critical='#cc0000',
               fill_low='#FF5511',
               fill_normal=color[3],
               foreground=color[3],
               decorations=[RectDecoration(colour=color[0],radius=7,filled=True)],
               percentage_critical=0.2,
               percentage_low=0.4,
               text_charging=' ({percentage:.0f}%) {ttf} to ',
               text_discharging=' ({percentage:.0f}%) {tte} Left',
            ),
            widget.TextBox(
              foreground=secondary_color[5],
              background=color[0],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.OpenWeather(
              background=secondary_color[5],
              foreground=color[0],
              app_key=w_appkey,
              cityid=w_cityid,
              weather_symbols={
                "Unknown": "",
                "01d": "",
                "01n": "",
                "02d": "",
                "02n": "",
                "03d": "",
                "03n": "",
                "04d": "",
                "04n": "",
                "09d": "⛆",
                "09n": "⛆",
                "10d": "",
                "10n": "",
                "11d": "🌩",
                "11n": "🌩",
                "13d": "❄",
                "13n": "❄",
                "50d": "🌫",
                "50n": "🌫",
                },
                format='{weather_details}',
                scroll=True,
                width=widget_width -100,
                metric=True,
                update_interval=600,
            ),
            widget.TextBox(
              foreground=secondary_color[3],
              background=secondary_color[5],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            ## Network
            widget.TextBox(
              background=secondary_color[3],
              text=wifi_icon,
              foreground=color[0],
            ),
            widget.Wlan(
              background=secondary_color[3],
              interface=wifi,
              format='{essid}',
              disconnected_message='',
              foreground=color[0],
              width=widget_width,
              scroll=True,
              scroll_repeat=True,
              scroll_interval=0.1,
              scroll_step=1,
              update_interval=1,
              mouse_callbacks={'Button1':lambda: qtile.function(network_widget)}),
            widget.Wlan(
              background=secondary_color[3],
              interface=wifi,
              format='{percent:2.0%}',
              disconnected_message='',
              foreground=color[0],
              mouse_callbacks={'Button1':lambda: qtile.function(network_widget)}
            ),
            widget.Net(
              prefix='M',
              interface=wifi,
              format='{down:4.1f}↓↑{up:3.1f}',
              foreground=color[0],
              use_bits=True,
              mouse_callbacks={'Button1':lambda: qtile.function(network_widget)},
              background=secondary_color[3]
            ),
            widget.TextBox(
              foreground=secondary_color[4],
              background=secondary_color[3],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.KeyboardLayout(
              background=secondary_color[4],
              configured_keyboards=['us intl', 'latam'],
              foreground=color[0],
            ),
            widget.TextBox(
              foreground=secondary_color[1],
              background=secondary_color[4],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            widget.Clock(
              foreground=color[0],
              format="%a %d %H:%M",
              update_interval=1,
              background=color[1],
              mouse_callbacks={'Button1': lambda: qtile.function(calendar_notification),'Button4': lambda: qtile.function(calendar_notification_prev),'Button5': lambda: qtile.function(calendar_notification_next)},
            ),
            widget.TextBox(
              foreground=color[0],
              background=secondary_color[4],
              padding=-1,
              fontsize=font_size+7,
              text="░▒▓",
            ),
            ]
    return widgets_list

def screen1_widgets():
    widgets_screen1=init_widgets_list()
    return widgets_screen1


def init_screens_bottom():
    return[Screen(bottom=bar.Bar(widgets=screen1_widgets(),size=bar_size,background=color[0],margin=bar_margin))]

def init_screens_top():
    return[Screen(top=bar.Bar(widgets=screen1_widgets(),size=bar_size,background=color[0],margin=bar_margin))]

if bar_position == "top":
    screens=init_screens_top()
else:
  screens=init_screens_bottom()

widgets_list = init_widgets_list()
widgets_screen1 = screen1_widgets()