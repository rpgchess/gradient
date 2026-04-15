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

## 💻 Como Compilar

### Pré-requisitos

- **Delphi 7+** (ou RAD Studio)
- **Windows**

### Compilação

1. Abrir `Project1.dpr` no Delphi
2. Pressionar **F9** (ou Build > Compile)
3. Executável será gerado na pasta do projeto

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

## 👨‍💻 Autor

Claudio Almeida

## 📝 Licença

Projeto educacional.

