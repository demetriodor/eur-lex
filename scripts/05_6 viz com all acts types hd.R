n=3
png('./figures/F6_com_allacts_types_hd.png', width=1200*n, height=900*n, res=96)

par(oma=c(6,5,22,4),
    par(mar=c(2,1,1,1)),
    bg=background.color,
    bty='n',
    family='Montserrat')
cdirs$cdirs<-as.numeric(as.character(cdirs$cdirs))

### main plot with dots
plot(xlim=c(1,18), ylim=c(0,900), NULL, axes=F, xlab="", ylab="", main='', cex.main=1.4, col.main=dark.color, font.main=2)
axis (2, font=1, tck=0.1, col=background.color, col.axis=dark.color, at=seq(0,900,100),line=-0.5, labels=seq(0,900,100), cex.axis=1.2*n)
abline(h=seq(0,900,100), col='grey')
abline(v=c(8.5 ,18.5), col='grey')
axis (1, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=1:18,line=-1.5, labels=regs$year.sem, cex.axis=1*n)


#lines (x=1:30, y = dirs$dirs, lwd=3, col=main.color3)
rect (xleft =seq(0.6, 17.6,1), xright =seq(1.4, 18.4,1), ybottom=rep(0,18), ytop=regs$regs, border=main.color2, col=main.color2)
rect (xleft =seq(0.68, 17.68,1), xright =seq(1.32, 18.32,1), ybottom=rep(0,18), ytop=regsi$regsi, border=main.color3, col=main.color3)
rect (xleft =seq(0.68, 17.68,1), xright =seq(1.32, 18.32,1), ybottom=rep(0,18), ytop=regsd$regsd, border=main.color3, col=main.color)

lines (x=1:8, y=rep(mean(regs$regs[1:8]),8), lwd=8, lty=2, col=main.color2)
lines (x=9:18, y=rep(mean(regs$regs[9:18]),10), lwd=8, lty=2, col=main.color2)

lines (x=1:8, y=rep(mean(regsi$regsi[1:8]),8), lwd=8, lty=2, col=main.color3)
lines (x=9:18, y=rep(mean(regsi$regsi[9:18]),10), lwd=8, lty=2, col=main.color3)

lines (x=1:8, y=rep(mean(regsd$regsd[1:8]),8), lwd=8, lty=2, col=main.color)
lines (x=9:18, y=rep(mean(regsd$regsd[9:18]),10), lwd=8, lty=2, col=main.color)


#title
mtext(expression(bold('Legislative Productivity of the European Union, 2004-2019: Types of acts')),
      line=5*n+2, font=1, at=0.025, col=dark.color, cex=1.8*n, adj=0, padj=1, outer=T)
mtext(expression(phantom ('Red bars ') * ' show the number of all legislative acts adopted by the Commission.  ' * phantom (' Green bars ') * 'show only'),
      line=2.5*n+2, font=3, at=0.025, col=dark.color, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression('Red bars ' * phantom (' show the number of all legislative acts adopted by the Commission.   Green bars show only')),
      line=2.5*n+2, font=3, at=0.025, col=main.color2, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom ('Red bars show the number of all legislative acts adopted by the Commission.  ') * ' Green bars ' * phantom('show only')),
      line=2.5*n+2, font=3, at=0.025, col=main.color, cex=1.2*n, adj=0, padj=1, outer=T)

mtext(expression('delegated ones and ' * phantom (' blue bars') * ' add implementing ones. The ' * phantom ('  ----- ') * ' lines show the averages per EP term.'),
      line=1*n+2, font=3, at=0.025, col=dark.color, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom('delegated ones and blue bars add implementing ones. The ') * '  ----- ' * phantom(' lines show the averages per EP term.')),
      line=1*n+2, font=3, at=0.025, col=main.color2, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom('delegated ones and ') * ' blue bars' * phantom (' add implementing ones. The  -----  lines show the averages per EP term.')),
      line=1*n+2, font=3, at=0.025, col=main.color3, cex=1.2*n, adj=0, padj=1, outer=T)

#signature
mtext(text=expression("- dimiter " * phantom(".eu") * " -"),
      side=1, line=2, outer=T, font=1, family='Cairo', col=dark.color, cex=1*n, adj=1, padj=1)
mtext(text=expression(phantom("- dimiter ") * ".eu" * phantom(" -")),
      side=1, line=2, outer=T, font=1, family='Cairo', col=main.color3, cex=1*n, adj=1, padj=1)

#data
mtext(text=expression("Data: " * phantom(" Own extraction from EUR-Lex")),
      side=1, line=2, outer=T, font=1, family='Cairo', col=dark.color, cex=1*n, adj=0, padj=1)
mtext(text=expression(phantom("Data: ") * " Own extraction from EUR-Lex"),
      side=1, line=2, outer=T, font=1, family='Cairo', col=main.color3, cex=1*n, adj=0, padj=1)

text('Eighth European Parliament', x=14, y=895, cex=1.2*n, col=dark.color, font=3)
text('Seventh European Parliament', x=4, y=895, cex=1.2*n, col=dark.color, font=3)


dev.off()
