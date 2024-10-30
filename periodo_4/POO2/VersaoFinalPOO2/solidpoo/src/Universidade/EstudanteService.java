package Universidade;

import java.util.List;

public class EstudanteService implements I_ConsultaEstudante {
    private List<Estudante> estudantes;

    public EstudanteService(List<Estudante> estudantes) {
        this.estudantes = estudantes;
    }

    @Override
    public void consultarEstudante() {
          for (Estudante estudante : estudantes) {
              System.out.println("Nome: " + estudante.getPessoa().getNome() +
                      ", Matrícula: " + estudante.getMatricula() +
                      ", Período: " + estudante.getPeriodo());
          }
    }
}