package com.algaworks.algafood.domain.model;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Setter
@Getter
@Embeddable
@AllArgsConstructor
@NoArgsConstructor
public class Endereco implements Serializable {

  @Column(name = "endereco_cep")
  private String cep;

  @Column(name = "endereco_logradouro")
  private String logradoro;

  @Column(name = "endereco_numero")
  private String numero;

  @Column(name = "endereco_complemento")
  private String complemento;

  @Column(name = "endereco_bairro")
  private String bairro;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "endereco_cidade_id")
  private Cidade cidade;


}
