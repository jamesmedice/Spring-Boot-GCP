package com.medici.app.config;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.medici.app.entity.Invoice;
import com.medici.app.repository.InvoiceRepository;

@Configuration
@EntityScan(basePackageClasses = { Invoice.class })
@EnableJpaRepositories(basePackageClasses = { InvoiceRepository.class })
@EnableAutoConfiguration
public class AutoConfiguration {

	@Value("${KUBERNETES_PORT_443_TCP}")
	private String KUBERNETES_PORT_443_TCP;

	@Value("${KUBERNETES_SERVICE_PORT}")
	private String KUBERNETES_SERVICE_PORT;

	@Value("${PORTALSERVICE_SERVICE_HOST}")
	private String PORTALSERVICE_SERVICE_HOST;

	@Value("${SECRETS_USER}")
	private String SECRETS_USER;

	@PostConstruct
	public void init() {
		System.out.println("[KUBERNETES_PORT_443_TCP]" + KUBERNETES_PORT_443_TCP);
		System.out.println("[KUBERNETES_SERVICE_PORT]" + KUBERNETES_SERVICE_PORT);
		System.out.println("[PORTALSERVICE_SERVICE_HOST]" + PORTALSERVICE_SERVICE_HOST);
		System.out.println("[SECRETS_USER]" + SECRETS_USER);
	}
}
