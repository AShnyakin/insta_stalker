package git.stalker.collector;

import git.stalker.collector.model.Human;
import git.stalker.collector.repository.HumanRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;

import java.util.List;

@SpringBootApplication
public class CollectorApplication {

	private final Logger logger = LoggerFactory.getLogger(CollectorApplication.class);

	public static void main(String[] args) {
		SpringApplication.run(CollectorApplication.class, args);
	}

	@Autowired
	private HumanRepository humanRepository;

	@EventListener(ApplicationReadyEvent.class)
	public void runAfterStartup() {
		createHuman();
		queryAllhumans();
	}

	private void createHuman() {
		Human newHuman = new Human();
		newHuman.setName("Velariy");
		newHuman.setDescription("Yamajka");
		logger.info("Saving new human...");
		this.humanRepository.save(newHuman);
	}

	private void queryAllhumans() {
		List<Human> allHumans = this.humanRepository.findAll();
		logger.info("Number of customers: " + allHumans.size());
	}

}
