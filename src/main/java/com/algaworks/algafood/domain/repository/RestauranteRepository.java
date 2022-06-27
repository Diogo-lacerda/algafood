package com.algaworks.algafood.domain.repository;

import com.algaworks.algafood.domain.model.Restaurante;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RestauranteRepository extends JpaRepository<Restaurante,Long> {
   @Query("from Restaurante r join r.cozinha join fetch r.formaPagamento") // a escrita dentro do parametro e uma JPQL.
    List<Restaurante> findAll();
}
