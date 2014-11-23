library(shiny)
options(shiny.reactlog=TRUE)

shinyServer(function(input,output){
        observe({
                # create x, y ranges for plots
               
                
                # Cobb-Douglass Model
                model<-  function(x,y,alpha,lambda,rho){
                       alpha<- as.numeric(input$alpha)
                       lambda<- as.numeric(input$lambda)
                       rho<- as.numeric(input$rho)
                        (lambda*(x^alpha)+(1-lambda)*(y^(alpha)))^(rho/alpha)
                      
                }
                x=y=seq(0,200,5)
                
                # generate surface values at given x-y points
                z<-outer(x,y,model)
                
                # create gradient for surface
                pal<-colorRampPalette(c("#f2f2f2", "RED"))
                colors<-pal(max(z))
                colors2<-pal(max(y)) 
                
                # plot functions
                output$p<-renderPlot({persp(x,y,z,
                                            theta=as.numeric(input$p1),
                                            phi=as.numeric(input$p2),
                                            col=colors[z],
                                            xlab="Share of labor",
                                            ylab="Share of Capital",
                                            zlab="Output"
                )})
                output$con<-renderPlot({contour(x,y,z,
                                                theta=as.numeric(input$p1),
                                                phi=as.numeric(input$p2),
                                                col=colors2[y],
                                                xlab="Share of Labor",
                                                ylab="Share of Capital"
                )})
        })
})
