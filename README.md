# Gradient - Delphi Graphics Demo 🎨

## 📌 Sobre o Projeto

Aplicação Delphi para demonstração e criação de gradientes gráficos. Projeto educacional focado em manipulação gráfica e renderização de efeitos visuais.

## 🎯 Objetivo

Explorar técnicas de desenho e manipulação de gráficos em Delphi, com foco em:
- Criação de gradientes (linear, radial)
- Algoritmos de interpolação de cores
- Manipulação de canvas e bitmaps
- Efeitos visuais em tempo real

## 🚀 Tecnologias Utilizadas

- **Delphi** - IDE e linguagem Object Pascal
- **VCL** - Visual Component Library
- **GDI/GDI+** - Graphics Device Interface

## 📁 Estrutura do Projeto

```
gradient/
├── Project1.dpr            # Arquivo principal do projeto
├── Project1.dproj          # Arquivo de projeto Delphi
├── Project1.res            # Recursos
├── Unit1.pas               # Unit principal
├── Unit1.dfm               # Form visual
└── README.md
```

## 🎨 Funcionalidades

- ✅ Criação de gradientes lineares
- ✅ Gradientes radiais
- ✅ Interpolação de cores RGB
- ✅ Controle de direção do gradiente
- ✅ Seleção de cores inicial e final
- ✅ Preview em tempo real
- ✅ Exportação de imagem

## 💻 Como Compilar e Executar

### Pré-requisitos

- **Delphi 7+** (ou RAD Studio XE+, Delphi 10.x)
- **Windows** (VCL é específico para Windows)

### Opção 1: Compilar com Delphi IDE (Recomendado)

1. Abrir `Project1.dpr` no Delphi
2. Project > Build Project1 (ou pressionar **Shift+F9**)
3. Run > Run (ou pressionar **F9**)
4. Executável será gerado em:
   - Debug: `Win32\Debug\Project1.exe`
   - Release: `Win32\Release\Project1.exe`

### Opção 2: Compilar via Linha de Comando

```bash
# Com Delphi Command Line Compiler (dcc32.exe)
dcc32 -B Project1.dpr

# Com MSBuild (RAD Studio XE2+)
msbuild Project1.dproj /t:Build /p:Config=Release
```

### Opção 3: Executável Pré-compilado

```bash
# Após compilar, execute diretamente:
.\Project1.exe
```

## 🔧 Como Usar

1. Executar o aplicativo compilado
2. Selecionar cor inicial
3. Selecionar cor final
4. Escolher tipo de gradiente (linear/radial)
5. Ajustar direção (se linear)
6. Visualizar resultado
7. Salvar imagem (opcional)

## 📐 Algoritmos Implementados

### Gradiente Linear

```pascal
for y := 0 to Height - 1 do
  for x := 0 to Width - 1 do
  begin
    ratio := x / Width;
    r := Round(r1 + (r2 - r1) * ratio);
    g := Round(g1 + (g2 - g1) * ratio);
    b := Round(b1 + (b2 - b1) * ratio);
    Canvas.Pixels[x, y] := RGB(r, g, b);
  end;
```

### Gradiente Radial

```pascal
for y := 0 to Height - 1 do
  for x := 0 to Width - 1 do
  begin
    distance := Sqrt(Sqr(x - centerX) + Sqr(y - centerY));
    ratio := distance / maxDistance;
    // Interpolação de cor baseada em distância...
  end;
```

## 🎓 Aprendizado

Este projeto demonstra:
- Manipulação de pixels individuais
- Algoritmos de interpolação
- Matemática aplicada a gráficos
- Otimização de renderização

## 🔬 Detalhes Técnicos

### Interpolação de Cores

A interpolação linear de cores RGB é feita pela fórmula:

```
C_result = C_start + (C_end - C_start) × ratio
```

Onde:
- `C_start` = Cor inicial (R, G ou B)
- `C_end` = Cor final (R, G ou B)
- `ratio` = Proporção (0.0 a 1.0)

### Performance

**Gradiente Linear:**
- Complexidade: O(w × h) onde w = largura, h = altura
- Para 800x600: 480.000 operações

**Otimizações possíveis:**
- Usar `TBitmap.ScanLine` em vez de `Canvas.Pixels` (até 100x mais rápido)
- Calcular cores por linha/coluna e reutilizar
- Usar buffers e double-buffering
- Implementar com DirectX/OpenGL para GPU

### Variações de Gradiente

```pascal
// Gradiente Horizontal
ratio := x / Width;

// Gradiente Vertical
ratio := y / Height;

// Gradiente Diagonal
ratio := (x + y) / (Width + Height);

// Gradiente Radial
distance := Sqrt(Sqr(x - centerX) + Sqr(y - centerY));
ratio := Clamp(distance / maxRadius, 0, 1);
```

## ⚙️ Melhorias Implementadas

### ✅ Configuração
- **EditorConfig** adicionado para encoding UTF-8
- Configuração de indentação Delphi/Pascal
- Line endings Windows (CRLF) configurados

### ✅ Documentação
- README expandido com exemplos de código
- Múltiplas opções de compilação documentadas
- Algoritmos explicados matematicamente
- Seção de otimizações de performance
- Variações de gradiente documentadas

### 🔧 Possíveis Melhorias Futuras

- [ ] Otimizar com `ScanLine` para melhor performance
- [ ] Adicionar gradientes cônico e angular
- [ ] Suporte a múltiplas cores (3+)
- [ ] Gradiente com transparência/alpha
- [ ] Exportar para múltiplos formatos (PNG, JPG, BMP)
- [ ] Presets de gradientes populares
- [ ] Histórico de gradientes criados
- [ ] Gerador de código CSS para gradientes web

## 📚 Recursos e Referências

### Documentação Delphi
- [VCL TCanvas](https://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TCanvas)
- [TBitmap](https://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TBitmap)
- [Color Functions](https://docwiki.embarcadero.com/Libraries/en/System.UITypes.TColor)

### Algoritmos Gráficos
- Linear Interpolation (LERP)
- Color Space Conversion
- Bilinear Interpolation

## 🎨 Exemplos de Uso

### Gradiente Azul → Vermelho
```
Cor Inicial: RGB(0, 0, 255)   - Azul
Cor Final:   RGB(255, 0, 0)   - Vermelho
Tipo: Linear Horizontal
```

### Gradiente Sol (Radial)
```
Cor Central: RGB(255, 255, 0)  - Amarelo
Cor Externa: RGB(255, 128, 0)  - Laranja
Tipo: Radial
Centro: (400, 300)
```

## 👨‍💻 Autor

Claudio Almeida

## 📝 Licença

Projeto educacional/demonstrativo

---

> **Nota**: Este projeto é uma demonstração educacional de técnicas de computação gráfica em Delphi.

## 👨‍💻 Autor

Claudio Almeida

## 📝 Licença

Projeto educacional.

