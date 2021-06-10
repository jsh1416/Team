<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!-- 06.10 봉찬균 join 작업 -->

<form method="POST">
  <fieldset>
    <legend>회원가입</legend>
    
    <div class="form-group">
      <label for="inputName" class="form-label mt-4">Name</label>
      <input type="text" class="form-control" id="inputName" placeholder="Input your name" name="name" autofocus>
    </div>
    
    <div class="form-group">
      <label for="exampleInputID" class="form-label mt-4">ID</label>
      <input type="text" class="form-control" id="exampleInputID" placeholder="Input ID" name="id">
    </div>
    
    <div class="form-group">
      <label for="inputNickName" class="form-label mt-4">Nick Name</label>
      <input type="text" class="form-control" id="inputNickName" placeholder="Input nick-name" name="nickName">
    </div>
    
    
    <div class="form-group">
      <label for="exampleInputEmail1" class="form-label mt-4">Email address</label>
      <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>
    
    <div class="form-group">
      <label for="exampleInputPassword1" class="form-label mt-4">Password</label>
      <input type="password" name="pw" class="form-control" id="exampleInputPassword1" placeholder="Password">
    </div>
    
    <div class="form-group">
      <label for="checkPassword" class="form-label mt-4">Check Password</label>
      <input type="password" class="form-control" id="checkPassword" placeholder="Check Password">
    </div>
    
    <div class="form-group">
      <label for="selectClub" class="form-label mt-4">Team</label>
<!--       club in ('Liverpool','Manchester United','Manchester City','Arsenal','Chelsea') -->
      <select class="form-select" id="selectClub" name="club">
        <option value="Liverpool">Liverpool</option>
        <option value="Manchester United">Manchester United</option>
        <option value="Manchester City">Manchester City</option>
        <option value="Arsenal">Arsenal</option>
        <option value="Chelsea">Chelsea</option>
      </select>
    </div>
    
    
    
<!--     <div class="form-group"> -->
<!--       <label for="exampleSelect2" class="form-label mt-4">Example multiple select</label> -->
<!--       <select multiple="" class="form-select" id="exampleSelect2"> -->
<!--         <option>1</option> -->
<!--         <option>2</option> -->
<!--         <option>3</option> -->
<!--         <option>4</option> -->
<!--         <option>5</option> -->
<!--       </select> -->
<!--     </div> -->
    
<!--     <div class="form-group"> -->
<!--       <label for="exampleTextarea" class="form-label mt-4">Example textarea</label> -->
<!--       <textarea class="form-control" id="exampleTextarea" rows="3"></textarea> -->
<!--     </div> -->
<!--     <div class="form-group"> -->
<!--       <label for="formFile" class="form-label mt-4">Default file input example</label> -->
<!--       <input class="form-control" type="file" id="formFile"> -->
<!--     </div> -->
<!--     <fieldset class="form-group"> -->
<!--       <legend class="mt-4">Radio buttons</legend> -->
<!--       <div class="form-check"> -->
<!--         <label class="form-check-label"> -->
<!--           <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios1" value="option1" checked=""> -->
<!--           Option one is this and that—be sure to include why it's great -->
<!--         </label> -->
<!--       </div> -->
<!--       <div class="form-check"> -->
<!--         <label class="form-check-label"> -->
<!--           <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios2" value="option2"> -->
<!--           Option two can be something else and selecting it will deselect option one -->
<!--         </label> -->
<!--       </div> -->
<!--       <div class="form-check disabled"> -->
<!--         <label class="form-check-label"> -->
<!--           <input type="radio" class="form-check-input" name="optionsRadios" id="optionsRadios3" value="option3" disabled=""> -->
<!--           Option three is disabled -->
<!--         </label> -->
<!--       </div> -->
<!--     </fieldset> -->
<!--     <fieldset class="form-group"> -->
<!--       <legend class="mt-4">Checkboxes</legend> -->
<!--       <div class="form-check"> -->
<!--         <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> -->
<!--         <label class="form-check-label" for="flexCheckDefault"> -->
<!--           Default checkbox -->
<!--         </label> -->
<!--       </div> -->
<!--       <div class="form-check"> -->
<!--         <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked=""> -->
<!--         <label class="form-check-label" for="flexCheckChecked"> -->
<!--           Checked checkbox -->
<!--         </label> -->
<!--       </div> -->
<!--     </fieldset> -->
<!--     <fieldset> -->
<!--       <legend class="mt-4">Switches</legend> -->
<!--       <div class="form-check form-switch"> -->
<!--         <input class="form-check-input" type="checkbox" id="flexSwitchCheckDefault"> -->
<!--         <label class="form-check-label" for="flexSwitchCheckDefault">Default switch checkbox input</label> -->
<!--       </div> -->
<!--       <div class="form-check form-switch"> -->
<!--         <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked=""> -->
<!--         <label class="form-check-label" for="flexSwitchCheckChecked">Checked switch checkbox input</label> -->
<!--       </div> -->
<!--     </fieldset> -->
<!--     <fieldset class="form-group"> -->
<!--       <legend class="mt-4">Ranges</legend> -->
<!--         <label for="customRange1" class="form-label">Example range</label> -->
<!--         <input type="range" class="form-range" id="customRange1"> -->
<!--         <label for="disabledRange" class="form-label">Disabled range</label> -->
<!--         <input type="range" class="form-range" id="disabledRange" disabled=""> -->
<!--         <label for="customRange3" class="form-label">Example range</label> -->
<!--         <input type="range" class="form-range" min="0" max="5" step="0.5" id="customRange3"> -->
<!--     </fieldset> -->
    <button type="submit" class="btn btn-primary">Join</button>
  </fieldset>
</form>

</body>
</html>