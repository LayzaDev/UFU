package Universidade;

import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class ConsultaProfessorTest {
    
    // Variável para capturar a saída do console durante os testes
    private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();

    // Método executado antes de cada teste para configurar a captura da saída do console
    @Before
    public void setup() {
        // Redireciona a saída do console para outContent
        System.setOut(new PrintStream(outContent));
    }

    @Test
    public void consultaProfessorTest() { 
        
        // Cria uma lista de professores
        List<Professor> professores = new ArrayList<>(); 
        
        // Cria uma lista de matérias lecionadas
        List<String> materiasLecionadas = Arrays.asList("Álgebra", "Cálculo");
        
        // Adiciona um professor à lista de professores
        professores.add(new Professor(new Pessoa("João", "12345678900", null, 'M'), "Matemática", materiasLecionadas));
        
        // Cria um serviço de professor com a lista de professores
        ProfessorService professorService = new ProfessorService(professores);

        // Chama o método de consulta de professor
        professorService.consultarProfessor();

        // Constroi a string esperada com base nos dados do professor adicionado
        String expected = "Nome: " + professores.get(0).getPessoa().getNome() +
                ", Área de Ensino: " + professores.get(0).getAreaEnsino() +
                ", Matérias Lecionadas: " + professores.get(0).getMateriasLecionadas();
        
        // Verifica se a saída esperada é igual à saída capturada do console
        Assert.assertEquals(expected.trim().toLowerCase(), outContent.toString().trim().toLowerCase());
    }
}
