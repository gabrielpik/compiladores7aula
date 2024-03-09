/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package unidade2;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

/**
 *
 * @author conta
 */
public class TesteAnalisador {
    
            // Define o caminho do arquivo de código fonte a ser analisado.
         public static void main(String[] args) {
        // Define o caminho do arquivo de código fonte a ser analisado.
        String caminhoArquivo = "C:\\Users\\conta\\Downloads\\teste.txt";
        
        // Prepara o arquivo para leitura.
        try (BufferedReader leitorTexto = new BufferedReader(new FileReader(caminhoArquivo))) {
            // Cria uma instância do analisador léxico gerado pelo JFlex.
            Lexer analisador = new Lexer(leitorTexto);
            
            // Processa o arquivo linha por linha.
            Token token;
            while ((token = analisador.yylex()) != null) {
                // Imprime a classificação léxica de cada token encontrado.
                System.out.println("Token: " + token);
            }
        } catch (IOException e) {
            // Trata possíveis erros de entrada/saída.
            e.printStackTrace();
        }
    }
  
}
