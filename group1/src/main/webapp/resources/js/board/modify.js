function modify(){
    swal({
      title :'수정',
      text:'정말 수정하시겠습니까',
      icon:'info',
      
      closeOnClickOutside: false,
      
      buttons : {
        cancle : {
           text : '수정 취소',
           value : false
        },
        
      confrim : {
           text : '수정 하기',
           value : true,
        }
      }
     })
                 
                 
                 
        .then((result) => {
           if(result){
              swal('게시글수정','게시글이 수정합니다','success',{
              
                 closeOnClickOutside:false,
                 closeOnEsc: false,
                 buttons : {
                    confirm :{
                       text: '확인',
                       value : location.href = cpath+'/board/modify/'+idxBo
                    }
                 }
                 })
     }
   })
          
   }
