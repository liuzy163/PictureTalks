package ca.zl.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.logging.LogLevel;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import ca.zl.logging.SimpleMethodLogging;
import ca.zl.service.ProblemSolvingService;

@Controller
public class ChatAndMapsController {
	private final ProblemSolvingService problemSolvingService;

	@Autowired
	public ChatAndMapsController(ProblemSolvingService problemSolvingService) {
		this.problemSolvingService = problemSolvingService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String indexPage() {
		return "index";
	}

	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chatPage() {
		return "chat";
	}

	// @RequestMapping("**")
	// @ResponseBody
	// public String fallbackRequestMapping() {
	// return
	// "Request not supported. The only legal http request is http://host/start";
	// }

	@RequestMapping(value = "/shutdown", method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.OK)
	@SimpleMethodLogging(beforeMessage = "User requesting power down!!!", level = LogLevel.WARN)
	public void shutdown() {
		System.exit(0);
	}
}
