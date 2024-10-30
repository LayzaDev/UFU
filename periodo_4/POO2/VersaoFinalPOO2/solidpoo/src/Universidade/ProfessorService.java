package Universidade;

import java.util.List;

public class ProfessorService implements I_ConsultaProfessor {
    private List<Professor> professores;

    public ProfessorService(List<Professor> professores) {
        this.professores = professores;
    }

    @Override
    public void consultarProfessor() {
         for (Professor professor : professores) {
             System.out.println("Nome: " + professor.getPessoa().getNome() +
                     ", Área de Ensino: " + professor.getAreaEnsino() +
                     ", Matérias Lecionadas: " + professor.getMateriasLecionadas());
         }
    }
}