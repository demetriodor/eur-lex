n=3
png('./figures/F4_com_all_hd.png', width=1200*n, height=900*n, res=96)

par(oma=c(6,5,22,4),
    par(mar=c(2,1,1,1)),
    bg=background.color,
    bty='n',
    family='Montserrat')
cdirs$cdirs<-as.numeric(as.character(cdirs$cdirs))

### main plot with dots
plot(xlim=c(1,30), ylim=c(0,1400), NULL, axes=F, xlab="", ylab="", main='', cex.main=1.4, col.main=dark.color, font.main=2)
axis (2, font=1, tck=0.1, col=background.color, col.axis=dark.color, at=seq(0,1400,200),line=-0.5, labels=seq(0,1400,200), cex.axis=1.2*n)
abline(h=seq(0,1400,200), col='grey')
abline(v=c(0.5, 10.5, 20.5, 30.5), col='grey')
axis (1, font=1, tck=-0.1, col=background.color, col.axis=dark.color, at=1:30,line=-1.5, labels=dirs$year.sem, cex.axis=1*n)


#lines (x=1:30, y = dirs$dirs, lwd=3, col=main.color3)
rect (xleft =seq(0.6, 29.6,1), xright =seq(1.4, 30.4,1), ybottom=rep(0,30), ytop=acts$acts, border=main.color2, col=main.color2)
rect (xleft =seq(0.68, 29.68,1), xright =seq(1.32, 30.32,1), ybottom=rep(0,30), ytop=regs$regs, border=main.color3, col=main.color3)
rect (xleft =seq(0.68, 29.68,1), xright =seq(1.32, 30.32,1), ybottom=rep(0,30), ytop=dirs$dirs, border=main.color3, col=main.color)

lines (x=1:10, y=rep(mean(acts$acts[1:10]),10), lwd=8, lty=2, col=main.color2)
lines (x=11:20, y=rep(mean(acts$acts[11:20]),10), lwd=8, lty=2, col=main.color2)
lines (x=21:30, y=rep(mean(acts$acts[21:30]),10), lwd=8, lty=2, col=main.color2)

lines (x=1:10, y=rep(mean(regs$regs[1:10]),10), lwd=8, lty=2, col=main.color3)
lines (x=11:20, y=rep(mean(regs$regs[11:20]),10), lwd=8, lty=2, col=main.color3)
lines (x=21:30, y=rep(mean(regs$regs[21:30]),10), lwd=8, lty=2, col=main.color3)

lines (x=1:10, y=rep(mean(dirs$dirs[1:10]),10), lwd=2, lty=2, col=main.color)
lines (x=11:20, y=rep(mean(dirs$dirs[11:20]),10), lwd=2, lty=2, col=main.color)
lines (x=21:30, y=rep(mean(dirs$dirs[21:30]),10), lwd=2, lty=2, col=main.color)

#title
mtext(expression(bold('Legislative Productivity of the European Union, 2004-2019: Commission acts')),
      line=5*n+2, font=1, at=0.025, col=dark.color, cex=1.8*n, adj=0, padj=1, outer=T)
mtext(expression(phantom ('Red bars ') * ' show the number of all legislative acts adopted by the Commission per semester.  ' * phantom (' Blue bars ') * 'show'),
      line=2.5*n+2, font=3, at=0.025, col=dark.color, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression('Red bars ' * phantom (' show the number of all legislative acts adopted by the Commission per semester.   Blue bars show')),
      line=2.5*n+2, font=3, at=0.025, col=main.color2, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom ('Red bars show the number of all legislative acts adopted by the Commission per semester.  ') * ' Blue bars ' * phantom('show')),
      line=2.5*n+2, font=3, at=0.025, col=main.color3, cex=1.2*n, adj=0, padj=1, outer=T)



mtext(expression('regulations and ' * phantom (' green bars ') * ' directives. The dashed  ' * phantom (' ---  ---') * 'horizontal lines show the averages per EP term.'),
      line=1*n+2, font=3, at=0.025, col=dark.color, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom('regulations and green bars directives. The dashed  ') * ' --- ' * phantom(' --- horizontal lines show the averages per EP term.')),
      line=1*n+2, font=3, at=0.025, col=main.color2, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom('regulations and green bars directives. The dashed  --- ') * ' --- ' * phantom('horizontal lines show the averages per EP term.')),
      line=1*n+2, font=3, at=0.025, col=main.color3, cex=1.2*n, adj=0, padj=1, outer=T)
mtext(expression(phantom('regulations and ') * ' green bars ' * phantom (' directives. The dashed  ---  --- horizontal lines show the averages per EP term.')),
      line=1*n+2, font=3, at=0.025, col=main.color, cex=1.2*n, adj=0, padj=1, outer=T)
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

text('Eighth European Parliament', x=25.5, y=1360, cex=1.2*n, col=dark.color, font=3)
text('Seventh European Parliament', x=16, y=1360, cex=1.2*n, col=dark.color, font=3)
text('Sixth European Parliament', x=5.5, y=1360, cex=1.2*n, col=dark.color, font=3)

dev.off()


