package fin.dto;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface DealsRepository extends CrudRepository<Deals, Long> {
}
