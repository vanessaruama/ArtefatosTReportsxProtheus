#include 'protheus.ch'

user function trep_job()
    local oSmartView as object
    
    //Caso não tenha o ambiente inicializado, se for executado dentro do Protheus pode comentar essa linha
    RpcSetEnv('T1', 'D MG 01', "admin", "1234") 

    oSmartView := totvs.framework.smartview.callSmartView():new("framework.sv.framework.product.default.rep", "report")
    oSmartView:setRunInJob(.T.)
    oSmartView:setParam("01", "0000007", "Disabled")
    oSmartView:setParam("02", "0000007", "Disabled")
    oSmartView:setForceParams(.T.)
    oSmartView:executeSmartView()

    oSmartView:destroy()

return