package edu.cibertec.models;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import java.util.Set;

@Entity
@Table(name = "Departamento")
public class Departamento {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int codDepartamento;

    @NotBlank
    @Column(name = "nombreDepartamento", nullable = false, length = 100)
    private String nombreDepartamento;
    
    @NotBlank
    @Column(name = "descripcionDpto", nullable = false, length = 100)
    private String descripcionDpto;

    @NotBlank
    @Column(name = "estado", nullable = false, length = 10)
    private String estado;

    @OneToMany(mappedBy = "departamento")
    private Set<Empleado> empleados;
    
    
    public Departamento() {
		super();
	}

	// Getters and Setters
    public int getCodDepartamento() {
        return codDepartamento;
    }

    public void setCodDepartamento(int codDepartamento) {
        this.codDepartamento = codDepartamento;
    }

    public String getNombreDepartamento() {
        return nombreDepartamento;
    }

    public void setNombreDepartamento(String nombreDepartamento) {
        this.nombreDepartamento = nombreDepartamento;
    }

    public String getDescripcionDpto() {
        return descripcionDpto;
    }

    public void setDescripcionDpto(String descripcionDpto) {
        this.descripcionDpto = descripcionDpto;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Set<Empleado> getEmpleados() {
        return empleados;
    }

    public void setEmpleados(Set<Empleado> empleados) {
        this.empleados = empleados;
    }
}
