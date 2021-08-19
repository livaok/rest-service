package com.example.restservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

/**
 * @author liva
 */
@RestController
public class GreetingController {

	private final AtomicLong number = new AtomicLong(0);

	@GetMapping("/hello")
	public Greeting hello(@RequestParam(value = "name", defaultValue = "Anon") String name) {
		return new Greeting(number.incrementAndGet(), name);
	}
}
