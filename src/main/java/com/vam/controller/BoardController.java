package com.vam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.vam.model.BoardVO;
import com.vam.service.BoardService;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardService bservice;

	/* 게시판 목록 페이지 접속 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	// => @RequestMapping(value="list", method=RequestMethod.GET)
	public void boardListGET(Model model) {

		log.info("게시판 목록 페이지 진입");

		model.addAttribute("list", bservice.getList());

	}

	@RequestMapping(value = "/enroll", method = RequestMethod.GET)
	public void boardEnrollGET() {

		log.info("게시판 등록 페이지 진입");

	}

	/* 게시판 등록 */
	@RequestMapping(value = "/enroll", method = RequestMethod.POST)
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {

		log.info("BoardVO : " + board);

		bservice.enroll(board);

		String msg = "등록완료";

		rttr.addFlashAttribute("msg", msg);

		return "redirect:/board/list";

	}

	/* 게시판 조회 */
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public void boardGetPageGET(int bno, Model model) {

		model.addAttribute("pageInfo", bservice.getPage(bno));

	}

	/* 수정 페이지 이동 */
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void boardModifyGET(int bno, Model model) {
		log.info("게시판 수정 페이지 진입");
		model.addAttribute("pageInfo", bservice.getPage(bno));

	}

	/* 페이지 수정 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String boardModifyPOST(BoardVO board, RedirectAttributes rttr) {

		bservice.modify(board);
		String msg = "수정완료";

		rttr.addFlashAttribute("msg", msg);
		System.out.println("수정완료");
//        rttr.addFlashAttribute("result", "modify success");

		return "redirect:/board/list";

	}

}
