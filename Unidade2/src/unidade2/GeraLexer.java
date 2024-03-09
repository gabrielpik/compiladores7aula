/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package unidade2;

import java.io.File;
import java.io.IOException;

/**
 *
 * @author conta
 */

    
    public class GeraLexer
{
    public static void main(String[] args) throws IOException
    {
        String CaminhoArquivo = "C:\\Users\\conta\\Documents\\NetBeansProjects\\Unidade2\\src\\unidade2\\Especificacao.flex";
        File arquivo = new File(CaminhoArquivo);
        jflex.Main.generate(arquivo);
    }
}
    

