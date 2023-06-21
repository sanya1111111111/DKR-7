uses GraphABC;
procedure DrawTopLoop(x, y, n: integer); 
begin
  line(x + n, y, x, y);
  line(x, y + n, x, y);
  line(x + n, y + n, x + n, y);
end;

procedure DrawLeftLoop(x, y, n: integer); 
begin
  line(x + n, y, x, y);
  line(x, y + n, x + n, y + n);
  line(x + n, y + n, x + n, y);
end;

procedure DrawRightLoop(x, y, n: integer); 
begin
  line(x + n, y, x, y);
  line(x, y + n, x + n, y + n);
  line(x, y + n, x, y);
end;

procedure DrawBottomLoop(x, y, n: integer); 
begin
  line(x + n, y, x + n, y + n);
  line(x, y + n, x + n, y + n);
  line(x, y + n, x, y);
end;

procedure DrawSquareWithLoops(x, y, n: integer);
begin
  DrawTopLoop(x, y, n);
  DrawBottomLoop(x - n, y, n);
  DrawTopLoop(x - 2 * n, y, n);
  line(x + n, y + n, x + n, y + 2 * n);
  DrawRightLoop(x, y + 2 * n, n);
  line(x - 2 * n, y + n, x - 2 * n, y + 2 * n);
  DrawLeftLoop(x - 2 * n, y + 2 * n, n);
end;

procedure DrawBiggestSquareWithLoops(x, y, n: integer);
begin
  DrawSquareWithLoops(x, y, n);
  line(x - 2 * n, y + 3 * n, x - 3 * n, y + 3 * n);
  DrawSquareWithLoops(x - 4 * n, y, n);
  line(x + n, y + 3 * n, x + n, y + 4 * n);
  line(x - 6 * n, y + 3 * n, x - 6 * n, y + 4 * n);
  DrawBottomLoop(x - 6 * n, y + 4 * n, n);
  DrawBottomLoop(x, y + 4 * n, n);
  line(x - n, y + 4 * n, x, y + 4 * n);
  line(x - 4 * n, y + 4 * n, x - 5 * n, y + 4 * n);
  DrawLeftLoop(x - 4 * n, y + 4 * n, n);
  DrawRightLoop(x - 2 * n, y + 4 * n, n);
  DrawRightLoop(x - 4 * n, y + 5 * n, n);
  DrawLeftLoop(x - 2 * n, y + 5 * n, n);
  DrawLeftLoop(x - 4 * n, y + 6 * n, n);
  DrawRightLoop(x - 2 * n, y + 6 * n, n);
  line(x - n, y + 7 * n, x, y + 7 * n);
  line(x - 5 * n, y + 7 * n, x - 4 * n, y + 7 * n);
DrawTopLoop(x - 6 * n, y + 6 * n, n);
DrawTopLoop(x, y + 6 * n, n);
end;

procedure DrawBigSquareWithRecursion(a, x, y, n, i: integer);
begin
  if a = 1 then
    DrawTopLoop(x, y, n)
  else if a = 2 then
    DrawSquareWithLoops(x, y, n)
  else if a = 3 then
    DrawBiggestSquareWithLoops(x, y, n)
  else if a > 3 then begin
    if i < a then begin
      if i mod 2 = 0 then begin
        x += 8 * n;
        y += 8 * n;
        DrawBiggestSquareWithLoops(x, y, n);
        i += 1;
        DrawBigSquareWithRecursion(a, x, y, n, i);
      end
      else begin
        x -= 8 * n; 
        DrawBiggestSquareWithLoops(x, y, n);
        i += 1;
        sleep(20);
        DrawBigSquareWithRecursion(a, x, y, n, i);
      end;
    end
    else
      exit;
  end;
end;



begin
var i := 0;
var a := ReadInteger('Введите глубину: ');
println();
var n := ReadInteger('Введите масштаб: ');
println();
var x := 50 + 300;
var y := 50;
DrawBigSquareWithRecursion(a, x, y, n, i);
end.