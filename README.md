# Compilando o projeto


Para compilar e executar o programa na placa FPGA realize os seguintes passos:

- Abra o arquivo .qpf dentro da pasta do projeto. 
- Em seguida abra o Altera Monitor
- Selecione “Abrir um projeto” . Navegue até o arquivo monitor.ncf dentro do diretório do projeto
- Vá até o Quartus 13.0sp1 e compile o projeto
- Ao final da compilação, abra o altera monitor novamente, clique em compilar 
- Clique em “Actions -> Convert Program o Hex File”
- Abra o quartus novamente. A seguir, clique em “Processing -> Update Memory Inicialization File”
- Ao final do processo clique duas vezes sobre a “Task”, “Assembler” e em “Sim”na caixa de diálogo.
- Programe a placa

Para testar novos valores, recomendamos a utilização da Calculadora presente na raiz do repositório. Ao gerar uma nova mensagem de 1KB, é necessário somente copiar e colar no código helloworld.s e realizar o processo de compilação novamente.