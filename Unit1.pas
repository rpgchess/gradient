unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TGradientKind = (gkHorizontal, gkVertical);

  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    chkDithered: TCheckBox;
    edtColors: TEdit;
    Label1: TLabel;
    chkVertical: TCheckBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure criaGradient(AWidth, AHeight: Integer; const StartColor, EndColor: TColor; const Colors: integer; const Style: TGradientKind; const Dithered: Boolean; var Bitmap: TBitmap);

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

procedure criaGradient(AWidth, AHeight: Integer; const StartColor, EndColor: TColor; const Colors: integer; const Style: TGradientKind; const Dithered: Boolean; var Bitmap: TBitmap);
const
  PixelCountMax = 32768;
type
  TGradientBand = array[0..255] of TColor;
  TRGBMap = packed record
    case boolean of
      True: (RGBVal: DWord);
      False: (R, G, B, D: Byte);
  end;
  PRGBTripleArray = ^TRGBTripleArray;
  TRGBTripleArray = array[0..PixelCountMax-1] of TRGBTriple;
const
  DitherDepth = 16;
var
  iLoop, xLoop, yLoop, XX, YY: Integer;
  iBndS, iBndE: Integer;
  GBand: TGradientBand;
  Row:  pRGBTripleArray;
  procedure CalculateGradientBand;
  var
    rR, rG, rB: Real;
    lCol, hCol: TRGBMap;
    iStp: Integer;
  begin
      lCol.RGBVal := ColorToRGB(StartColor);
      hCol.RGBVal := ColorToRGB(EndColor);

    rR := (hCol.R - lCol.R) / (Colors - 1);
    rG := (hCol.G - lCol.G) / (Colors - 1);
    rB := (hCol.B - lCol.B) / (Colors - 1);
    for iStp := 0 to (Colors - 1) do
      GBand[iStp] := RGB(
        lCol.R + Round(rR * iStp),
        lCol.G + Round(rG * iStp),
        lCol.B + Round(rB * iStp)
        );
  end;
begin

  if Bitmap.PixelFormat <> pf24bit then
    Bitmap.PixelFormat := pf24bit;

  CalculateGradientBand;

  with Bitmap.Canvas do
  begin
    Brush.Color := StartColor;
    FillRect(Bounds(0, 0, AWidth, AHeight));
    if Style = gkVertical then
    begin
      for iLoop := 0 to Colors - 1 do
      begin
        iBndS := MulDiv(iLoop, AWidth, Colors);
        iBndE := MulDiv(iLoop + 1, AWidth, Colors);
        Brush.Color := GBand[iLoop];
        PatBlt(Handle, iBndS, 0, iBndE, AHeight, PATCOPY);
        if (iLoop > 0) and (Dithered) then
          for yLoop := 0 to DitherDepth - 1 do if (yLoop < AHeight)  then
            begin
            Row := Bitmap.Scanline[yLoop];
            for xLoop := 0 to AWidth div (Colors - 1) do
              begin
              XX:= iBndS + Random(xLoop);
              if (XX < AWidth) and (XX > -1) then
               with Row[XX] do
                begin
                rgbtRed := GetRValue(GBand[iLoop - 1]);
                rgbtGreen := GetGValue(GBand[iLoop - 1]);
                rgbtBlue := GetBValue(GBand[iLoop - 1]);
                end;
              end;
            end;
      end;
      for yLoop := 1 to AHeight div DitherDepth do
        CopyRect(Bounds(0, yLoop * DitherDepth, AWidth, DitherDepth),
          Bitmap.Canvas, Bounds(0, 0, AWidth, DitherDepth));
    end
    else
    begin
      for iLoop := 0 to Colors - 1 do
      begin
        iBndS := MulDiv(iLoop, AHeight, Colors);
        iBndE := MulDiv(iLoop + 1, AHeight, Colors);
        Brush.Color := GBand[iLoop];
        PatBlt(Handle, 0, iBndS, AWidth, iBndE, PATCOPY);
        if (iLoop > 0) and (Dithered) then
          for yLoop := 0 to AHeight div (Colors - 1) do
            begin
            YY:=iBndS + Random(yLoop);
            if (YY < AHeight) and (YY > -1) then
             begin
             Row := Bitmap.Scanline[YY];
             for xLoop := 0 to DitherDepth - 1 do if (xLoop < AWidth)  then with Row[xLoop] do
               begin
               rgbtRed := GetRValue(GBand[iLoop - 1]);
               rgbtGreen := GetGValue(GBand[iLoop - 1]);
               rgbtBlue := GetBValue(GBand[iLoop - 1]);
               end;
             end;
            end;
      end;
      for xLoop := 0 to AWidth div DitherDepth do
        CopyRect(Bounds(xLoop * DitherDepth, 0, DitherDepth, AHeight),
          Bitmap.Canvas, Bounds(0, 0, DitherDepth, AHeight));
    end;
  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  GK: TGradientKind;
  Bmp: TBitmap;
begin
  if chkVertical.Checked then
    GK := gkVertical
  else
    GK := gkHorizontal;
  Bmp := TBitmap.Create;
  Bmp.Width := 300; Bmp.Height := 200-43;
  criaGradient(Bmp.Width,Bmp.Height,clBlack,clGray,StrToInt(edtColors.Text),GK,chkDithered.Checked,Bmp);
//  Bmp.SaveToFile('C:\Windows\Desktop\BmpGradiente.bmp');
  Canvas.Draw(0,43,Bmp);
  Bmp.Free;
end;

end.
