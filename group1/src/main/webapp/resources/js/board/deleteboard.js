function deleteBoard(){
    swal({
      title :'게시글을 삭제??',
      text:'정말 삭제하시겠습니까',
      icon:'info',
      
      closeOnClickOutside: false,
      
      buttons : {
        cancle : {
           text : '삭제 취소',
           value : false
        },
        
      confrim : {
           text : '삭제 하기',
           value : true,
        }
      }
     })
                 
                 
                 
        .then((result) => {
           if(result){
              swal('게시글삭제','게시글이 없어졌습니다','success',{
              
                 closeOnClickOutside:false,
                 closeOnEsc: false,
                 buttons : {
                    confirm :{
                       text: '확인',
                       value :  location.href = cpath+'/board/delete?idxBo='+idxBo
                    }
                 }
                 })
     }
   })
          
   }
