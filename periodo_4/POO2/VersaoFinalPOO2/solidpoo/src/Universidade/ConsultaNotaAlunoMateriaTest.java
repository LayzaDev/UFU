package Universidade;

import org.junit.Test;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.List;
import static org.junit.Assert.assertEquals;

public class ConsultaNotaAlunoMateriaTest {

    private final ByteArrayOutputStream outContent = new ByteArrayOutputStream();

    @Test
    public void testConsultarNotaAlunoMateria() {
        
        // Preparação dos dados de teste
        Endereco endereco = new Endereco("Rua Pessoa 1", "456", "Bairro A", "54321-876", "");
        Pessoa pessoa = new Pessoa("João", "12345678900", endereco, 'M');
        Estudante estudante = new Estudante(pessoa, "20220001", "3º Período");
        Professor professor = new Professor(null, null, null);
        Materia materia = new Materia("Matemática", "Cálculo I", null, professor);
        
        // Adiciona o estudante à lista de alunos da matéria
        materia.getListaAlunos().add(estudante);
        
        // Adiciona a nota do aluno à lista de notas da matéria
        materia.getNotasAlunos().add(8.5);
        
        // Cria uma lista de matérias
        List<Materia> materias = new ArrayList<>();
        // Adiciona a matéria à lista de matérias
        materias.add(materia);

        // Redirecionar a saída padrão para capturar a impressão na tela
        System.setOut(new PrintStream(outContent));

        // Executar o método a ser testado
        NotaAlunoMateriaService notaAlunoMateriaService = new NotaAlunoMateriaService(materias);
        notaAlunoMateriaService.consultarNotaAlunoMateria(estudante, materia);

        // Verificar se a saída é conforme o esperado
        String expectedOutput = "Nota do aluno João na matéria Cálculo I: 8.5";
        assertEquals(expectedOutput, outContent.toString().trim());
    }
}
