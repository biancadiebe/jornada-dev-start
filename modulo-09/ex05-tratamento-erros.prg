FUNCTION Main()
   LOCAL nA := 10, nB := 0, nRes
   LOCAL oErro

   BEGIN SEQUENCE //bloco "protegido" tudo que da erro vai pro recover
      IF nB == 0 //validação para entender que divisão por zero é um erro
         oErro := ErrorNew() //cria um objeto de erro em branco
         oErro:Description := "Divisao por zero" //preenche o erro com o texto
         Break(oErro) //faz o break e joga pro recover
      ENDIF
      nRes := nA / nB
      QOut("Resultado: " + Str(nRes))
   RECOVER USING oErro
      QOut("Erro capturado: " + oErro:Description)
   END SEQUENCE

   QOut("O programa continua de pe!")

RETURN NIL