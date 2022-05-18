package com.pcwk.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import com.google.gson.Gson;
import com.pcwk.cmn.MessageVO;
import com.pcwk.cmn.SearchVO;
import com.pcwk.cmn.StringUtil;

/**
 * Servlet implementation class BoardController
 */
@WebServlet(description = "게시판 컨트롤러", urlPatterns = { "/board/board.do" })
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
     final Logger LOG = Logger.getLogger(this.getClass());
     BoardDao boardDao;
     
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
         boardDao = new BoardDao();
    }

	/**
	 * VIEW work_div=doSave -> 
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//   work_div   doSave
//     			doRetrieve
//     			doSelectOne
//     			doUpdate
//     			doDelete
		//request에 인코딩: UTF-8
	   request.setCharacterEncoding("UTF-8");
	  //String workDiv = request.getParameter("work_div")==null?"":request.getParameter("work_div");
	  String workDiv = StringUtil.nvl(request.getParameter("work_div"),"");
	  LOG.debug("=============================");
	  LOG.debug("=workDiv="+workDiv);
	  LOG.debug("=============================");
	  
	  //DAO분기
	 switch(workDiv) {
	 case "doDelete":
		 doDelete(request, response);
		 break;
	 
	 case "doSelectOne":
		 doSelectOne(request, response);
		 break;
	 
	 case "moveToReg":
		 moveToReg(request, response);
		 break;
	 
	 case "doRetrieve":
		 doRetrieve(request, response);
		 break;
	 
	 case "doSave": //등록 http://localhost:8081/studyhtml5/board/board.do?work_div=doSave
		 doSave(request, response);
		 break;
	 }

	 
	}
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      LOG.debug("=============================");
		  LOG.debug("=doDelete()=");
		  LOG.debug("=============================");
		  BoardVO param = new BoardVO();
		  String seq = StringUtil.nvl(request.getParameter("seq"), "-1");
		  LOG.debug("-seq-" + seq);
		//param read
		  
		//param to BoardVo
		  param.setSeq(Integer.parseInt(seq));
		  LOG.debug("-param-" + param);
		//BoardDAO 호출
		  int flag = this.boardDao.doDelete(param);
		  MessageVO msgVO = new MessageVO();
		  
		  String msg = "";
		  if(1==flag) {
			  msg = "삭제 되었습니다.";
		  }
		  else {
			  msg = "삭제 실패...";
		  }
		  
		  msgVO.setMessageId(String.valueOf(flag));
		  msgVO.setMsgContents(msg);
		  
		  // MessageVO -> json
		  String jsonString = new Gson().toJson(msgVO);
		  LOG.debug("-jsonString-" + jsonString);
		  
		  response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  out.print(jsonString);
		  
		//BoardDAO 처리 return받아 화면으로 전송
	}
	
	 protected void doSelectOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  LOG.debug("=============================");
		  LOG.debug("=doSelectOne()=");
		  LOG.debug("=============================");
		  BoardVO param = new BoardVO();
		  
		  //param read
		  String seq = StringUtil.nvl(request.getParameter("seq"), "-1");
		  LOG.debug("--------------------------");
		  LOG.debug("-seq-"+seq);
		  LOG.debug("--------------------------");
		  
		  //param to BoardVo
		  param.setSeq(Integer.parseInt(seq));
		  LOG.debug("-param-"+param);
		  
		  //BoardDAO 호출
		  BoardVO outVO = this.boardDao.doSelectOne(param);
		  LOG.debug("-outVO-"+outVO);
		  
		  //BoardDAO 처리 return받아 화면으로 전송
		  request.setAttribute("vo", outVO);
		  RequestDispatcher dispacher = request.getRequestDispatcher("/board/board_mod.jsp");
		  dispacher.forward(request, response);
		  
		  //board_mod.jsp
	 }
	
	
	 protected void moveToReg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  LOG.debug("=============================");
		  LOG.debug("=moveToReg()=");
		  LOG.debug("=============================");
		  
		  RequestDispatcher dispatcher = request.getRequestDispatcher("/board/board_reg.jsp");//contextPath생략
		  
		  dispatcher.forward(request, response);
		  
	 }
	
	 
	 protected void doRetrieve(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 LOG.debug("===================================");
		 LOG.debug("=doRetrieve()=");
		 LOG.debug("===================================");
		 SearchVO param= new SearchVO();
		 //parm read
         /*
          * searchDiv="" searchWord="" pageSize=10 pageNum=1
          */
		 String searchDiv  = StringUtil.nvl(request.getParameter("searchDiv"),"");
		 String searchWord = StringUtil.nvl(request.getParameter("searchWord"),"");
		 String pageSize   = StringUtil.nvl(request.getParameter("pageSize"),"10");
		 String pageNum    = StringUtil.nvl(request.getParameter("pageNum"),"1");
		 LOG.debug("-----------------------------------");
		 LOG.debug("searchDiv:"+searchDiv);
		 LOG.debug("searchWord:"+searchWord);
		 LOG.debug("pageSize:"+pageSize);
		 LOG.debug("pageNum:"+pageNum);
		 LOG.debug("-----------------------------------");
		 //param to SeachVo
		 param.setSearchDiv(searchDiv);
		 param.setSearchWord(searchWord);
		 param.setPageSize(Integer.parseInt(pageSize));
		 param.setPageNum(Integer.parseInt(pageNum));
		 LOG.debug("param:"+param.toString());
		 //BoardDAO 호출
		 List<BoardVO> list = this.boardDao.doRetrieve(param);
		 
		 //BoardDAO 처리 return받아 화면으로 전송
		 if(list.size()>0) {
			 for(BoardVO vo :list) {
				 LOG.debug("vo:"+vo);
			 }
		 }
		 
		 //request에 list를 담아 전송
		  request.setAttribute("list", list);
		  //param
		  request.setAttribute("param", param);
		  
		  //받은 url : /board/board_list.jsp
		  RequestDispatcher dispatcher = request.getRequestDispatcher("/board/board_list.jsp");//contextPath생략
		  
		  //data전송
		  dispatcher.forward(request, response);
		  
	 }
	 protected void doSave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  LOG.debug("=============================");
		  LOG.debug("=doSave=");
		  LOG.debug("=============================");
		  BoardVO paramVO = new BoardVO();
		  //paramSet
		  //seq,title,contents,reg_id,mod_id
		  
		  
		  String title = StringUtil.nvl(request.getParameter("title"),"");
		  String seq = StringUtil.nvl(request.getParameter("seq"),"0");
		  String regId = StringUtil.nvl(request.getParameter("reg_id"),"");
		  String contents = StringUtil.nvl(request.getParameter("contents"),"");	
		  LOG.debug("=title="+title);

		  String modId = regId; //최초 등록시 등록자id와 수정자id는 동일하다.
		  
		  paramVO.setSeq(Integer.parseInt(seq));
		  paramVO.setTitle(title);
		  paramVO.setRegId(regId);
		  paramVO.setModId(modId);
		  paramVO.setContents(contents);
	
		  LOG.debug("=paramVO="+paramVO.toString());
		  
		  //DAO호출
		  int flag = this.boardDao.doSave(paramVO);
		  LOG.debug("=flag="+flag);
		  
		  
		  //VIEW전송
		  //flag: 1성공, 0실패
		  MessageVO msgVO = new MessageVO();
		  msgVO.setMessageId(String.valueOf(flag));
		  
		  String message = "";
		  if(1==flag) {
			  message = "등록성공!";
		  }else {
			  message = "등록실패!";
		  }
		  
		  msgVO.setMsgContents(message);
		  
		  Gson gson = new Gson();
		  String jsonString = gson.toJson(msgVO);
		  
		  LOG.debug("==============");
		  LOG.debug("=jsonString="+jsonString);
		  LOG.debug("==============");
		  
		  //VIEW전송
		  //response encoding
		  response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  out.print(jsonString);
		  }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}