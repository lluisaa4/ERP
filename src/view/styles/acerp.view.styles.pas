unit acerp.view.styles;

interface

uses
  System.SysUtils,
  System.UITypes;

const //padrões de cores para o sistema
  PRIMARY = $FF007bff;
  SECONDARY = $6c757d;
  SUCESS = $FF28a745;
  IFNO = $FF17a2b8;
  WARNING = $FFffc107;
  DANGER = $FFdc3545;
  LIGHT = $FFf8f9fa;
  DARK = $FF343a40;
  WHITE = $FFFFFFFF;

  FONT_SIZE_H1 = 24;
  FONT_SIZE_H2 = 22;
  FONT_SIZE_H3 = 20;
  FONT_SIZE_H4 = 18;
  FONT_SIZE_H5 = 16;
  FONT_SIZE_H6 = 14;
  FONT_SIZE_H7 = 12;
  FONT_SIZE_H8 = 10;
  FONT_SIZE_S = 8;

var
  BACKGROUND: TAlphaColor = WHITE;
  FONT_COLOR: TAlphaColor = SECONDARY;
  FONT_COLOR_CONTRAST: TAlphaColor = WHITE;

  IMAGE_COLOR: TAlphaColor = SECONDARY;

implementation

end.
