#' 查看即时库存更新报表
#'
#' @param input 输入
#' @param output 输出
#' @param session 会话
#' @param dms_token 口令
#'
#' @return 返回值
#' @export
#'
#' @examples
#' stockTable()
stockTable <- function(input,output,session,dms_token) {
  var_txt_FMaterialId=tsui::var_text('txt_FMaterialId')
  var_txt_companyName=tsui::var_text('txt_companyName')
  var_txt_Flot=tsui::var_text('txt_Flot')
  var_txt_FBillNO = tsui::var_text('txt_FBillNO')
  var_txt_Fsalesman = tsui::var_text('txt_Fsalesman')
  var_txt_FCustName = tsui::var_text('txt_FCustName')
  
  shiny::observeEvent(input$dl_stockTable_query,{
    token <- dms_token
    FMaterialId <- var_txt_FMaterialId()
    companyName <- var_txt_companyName()
    Flot <-var_txt_Flot()
    FBillNO <-var_txt_FBillNO()
    Fsalesman <-var_txt_Fsalesman()
    FCustName <-var_txt_FCustName()
    
    data <- mdlSaleBillCheckr::stockTable_query(token = token,FMaterialId =FMaterialId ,
                                                companyName =companyName ,Flot =Flot ,
                                                FBillNO = FBillNO,Fsalesman =Fsalesman ,FCustName = FCustName)
    
    
    tsui::run_dataTable2(id = 'dt_stockTable_dataView',data = data)
    
  })
  
  
  
  
}
