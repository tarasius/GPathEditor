unit fmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin;

const scale=4;
      FormCaption='GPath Editor';
type
  TPointArray=array of tpoint;

  TCustomPanel = class(TPanel)
    protected
      finished:boolean;
      SizeX, SizeY:integer;
      procedure Paint; override;
      procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
      procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
        X, Y: Integer); override;
      procedure MouseLeave(Sender: TObject);
      procedure DrawGrid;
      procedure DrawMark(x,y:integer);
      procedure DrawLine(x,y:integer);
      procedure DrawPolygon;
      procedure AddToMemo(x,y:integer);
    public
      CurrentX,CurrentY:integer;
      Points:TPointArray;
      procedure Clear;
      procedure Finish;
      procedure Continue;
      procedure SetSize(x,y:integer);
      constructor Create(AOwner: TComponent); override;
  end;

  TForm1 = class(TForm)
    Panel1: TPanel;
    MemoCode: TMemo;
    ButtonFinish: TButton;
    ButtonClear: TButton;
    EditFigureName: TEdit;
    ButtonCopy: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    seSizeX: TSpinEdit;
    seSizeY: TSpinEdit;
    ButtonUndo: TButton;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    seOffsetX: TSpinEdit;
    seOffsetY: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonFinishClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure EditFigureNameExit(Sender: TObject);
    procedure EditFigureNameKeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCopyClick(Sender: TObject);
    procedure seSizeXChange(Sender: TObject);
    procedure ButtonUndoClick(Sender: TObject);
  private
    { Private declarations }
    DrawPanel:TCustomPanel;
    procedure PrepareMemo;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses clipbrd, math;

procedure TForm1.ButtonFinishClick(Sender: TObject);
begin
  if ButtonFinish.Tag=1 then begin
    ButtonFinish.Caption:='Finish';
    ButtonFinish.Tag:=0;
    DrawPanel.Continue;
  end else begin
    DrawPanel.Finish;
    ButtonFinish.caption:='Continue';
    ButtonFinish.Tag:=1;
  end;
end;

procedure TForm1.ButtonUndoClick(Sender: TObject);
begin
  DrawPanel.finished:=false;
  setlength(DrawPanel.points, length(DrawPanel.points)-1);
  DrawPanel.paint;
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  if MessageDlg('Are you sure you want to clear drawing?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
    exit;
  DrawPanel.finished:=false;
  DrawPanel.CurrentX:=-1;
  DrawPanel.CurrentY:=-1;
  ButtonFinish.Caption:='Finish';
  ButtonFinish.Tag:=0;
  DrawPanel.Clear;
  setlength(DrawPanel.points,0);
  PrepareMemo;
end;

procedure TForm1.ButtonCopyClick(Sender: TObject);
begin
  clipboard.AsText:=MemoCode.Lines.Text;
end;

procedure TForm1.EditFigureNameExit(Sender: TObject);
begin
  MemoCode.Lines[1]:=EditFigureName.Text;
end;

procedure TForm1.EditFigureNameKeyPress(Sender: TObject; var Key: Char);
begin
  if key=#13 then
    MemoCode.Lines[1]:=EditFigureName.Text;
end;

procedure TForm1.FormCreate(Sender: TObject);
var h:integer;
begin
  DrawPanel:=TCustomPanel.Create(self);
  DrawPanel.Parent:=form1;
  DrawPanel.Left:=8;
  DrawPanel.Top:=8;
  DrawPanel.Color:=clwhite;
  DrawPanel.Visible:=true;
  PrepareMemo;
  caption:=FormCaption;
  DrawPanel.SetSize(144,168);
  h:=form1.Canvas.TextHeight('A');
  EditFigureName.Top:=MemoCode.Top + h + h div 8+1;
  EditFigureName.Height:=h+3;
end;

{ TCustomPanel }

procedure TCustomPanel.AddToMemo(x, y: integer);
begin
  form1.MemoCode.Lines.Insert(form1.MemoCode.Lines.Count-2, format('    {%d,%d},',
        [x+form1.seOffsetX.Value,y+form1.seOffsetY.Value]));
  form1.MemoCode.Lines[2]:=format('= { %d,',[length(points)]);
end;

procedure TCustomPanel.Clear;
begin
  PatBlt(Canvas.Handle, 0, 0, ClientWidth, ClientHeight, WHITENESS);
  DrawGrid;
end;

procedure TCustomPanel.Continue;
begin
  finished:=false;
  Paint;
end;

constructor TCustomPanel.Create(AOwner: TComponent);
begin
  inherited;
  finished:=false;
  CurrentX:=-1;
  CurrentY:=-1;
  OnMouseLeave:=MouseLeave;
end;

procedure TCustomPanel.DrawGrid;
var i, j :integer;
begin
  PatBlt(Canvas.Handle, 0, 0, ClientWidth, ClientHeight, WHITENESS);
  canvas.pen.Color:=clGray;
  canvas.pen.Width:=1;
  for I := 0 to width-1 do
    if i mod scale=0 then begin
      canvas.MoveTo(i,0);
      canvas.LineTo(i,height);
    end;
  for j := 0 to height-1 do
    if j mod scale=0 then begin
      canvas.MoveTo(0,j);
      canvas.LineTo(width,j);
    end;
end;

procedure TCustomPanel.DrawLine(x, y: integer);
begin
  canvas.pen.Color:=clBlack;
  canvas.pen.Width:=2;
  canvas.LineTo(x,y);
end;

procedure TCustomPanel.DrawMark(x, y: integer);
begin
  canvas.Brush.Color:=clRed;
  canvas.FillRect(TRect.Create(x,y,x+scale, y+scale));
end;

procedure TCustomPanel.DrawPolygon;
var scalepoints:TPointArray;
    i:integer;
begin
  setlength(scalepoints, length(points));
  for i := 0 to length(points)-1 do
  begin
    scalepoints[i].x:=points[i].X*scale;
    scalepoints[i].y:=points[i].Y*scale;
  end;
  canvas.Brush.Color:=clblack;
  canvas.Pen.Color:=clblack;
  canvas.Polygon(scalepoints);
end;

procedure TCustomPanel.Finish;
begin
  Clear;
  finished:=true;
  DrawPolygon;
end;

procedure TCustomPanel.MouseLeave(Sender: TObject);
begin
  form1.caption:=FormCaption;
end;

procedure TCustomPanel.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  form1.Caption:=format('%d : %d', [(x div scale)+form1.seOffsetX.Value,(y div scale)+form1.seOffsetY.Value]);
end;

procedure TCustomPanel.MouseUp(Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var rx,ry,l:integer;
begin
  inherited;
  if finished then exit;  
  rx:=(x div scale)*scale;
  ry:=(y div scale)*scale;
  drawmark(rx,ry);
  rx:=x div scale;
  ry:=y div scale;
  l:=length(points);
  setlength(points, l+1);
  points[l].Create(rx,ry);
  AddToMemo(rx,ry);
  if CurrentX<0 then
  begin
    canvas.MoveTo(x,y);
  end else
  begin
    drawline(x,y);
  end;
  currentX:=x;
  currentY:=y;
end;

procedure TCustomPanel.Paint;
var i,m:integer;
begin
  inherited;
  DrawGrid;
  if finished then
    DrawPolygon
  else begin
    if length(points)=0 then exit;
    m:=scale div 2;
    canvas.MoveTo(points[0].x*scale+m, points[0].y*scale+m);
    for i:=1 to length(points)-1 do
    begin
      drawmark(points[i].X*scale, points[i].Y*scale);
      drawline(points[i].X*scale+m, points[i].Y*scale+m);
    end;
  end;
end;

procedure TCustomPanel.SetSize(x, y: integer);
begin
  SizeX:=x;
  SizeY:=y;
  Width:=x*scale;
  Height:=y*scale;
  Form1.Width:=x*scale+28+Form1.Panel1.Width;
  Form1.Height:=max(Form1.MemoCode.Height+Form1.GroupBox1.Height+Form1.ButtonFinish.Height+70, y*scale+22)
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  freeandnil(DrawPanel);
end;

procedure TForm1.PrepareMemo;
begin
  MemoCode.Lines.Clear;
  MemoCode.Lines.Add('const GPathInfo'+slinebreak+' GENERATED_POINTS '+slinebreak+'= { 0,'+slinebreak+'  (GPoint []) {');
  MemoCode.Lines.Add('  }'+slinebreak+'}');
  EditFigureName.text:='Generated_Points';
end;

procedure TForm1.seSizeXChange(Sender: TObject);
begin
  DrawPanel.SetSize(seSizeX.Value, seSizeY.Value);
end;

end.
