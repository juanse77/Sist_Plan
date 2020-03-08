<h1>Sistema solar:</h1>

<p>Este proyecto es una extensi�n del anterior, en el que se gener� una simulaci�n del sistema solar. La novedad en este trabajo es la introducci�n de una nave capaz de viajar a trav�s del sistema. El objetivo que se buscaba con esto era la utilizaci�n de una c�mara que se moviese junto con la nave y que proporcionase al usuario una visi�n en primera persona.</p>

<h2>Controles</h2>

<p>El usuario puede hacer uso de las teclas de direcci�n para orientar la nave y de las teclas de aceleraci�n (a) y frenado (f) de la misma. Tambi�n puede utilizar la tecla (c) para cambiar de modo de visualizaci�n, pasando alternativamente de la visi�n panor�mica a la visi�n en primera persona.</p>

<p>La visi�n panor�mica se puede rotar hacia arriba (u) y hacia abajo (d), esta funcionalidad s�lo permanece activa en el modo de visualizaci�n panor�mico. Como en el anterior trabajo se ha mantenido la funci�n de pausa la cual se activa con la tecla (espacio).</p>

<h2>Detalles de implementaci�n</h2>

<p>La aplicaci�n se ha realizado en Processing y en ella se ha utilizado los m�todos pushMatrix, popMatrix, rotate y translate, ya introducidos en la anterior pr�ctica, y como novedad se ha hecho uso del m�todo camera. Este m�todo es el que posibilita cambiar la perspectiva del usuario y navegar por el sistema planetario.</p>

<p>En la generaci�n de los planetas y sat�lites se ha hecho uso de una clase que posee como atributos principales: el radio del planeta, el radio de la �rbita, la velocidad de traslaci�n, la velocidad de rotaci�n y la posici�n inicial dentro de su �rbita que se generar� aleat�riamente.</p>

<p>Adem�s, esta clase contiene el m�todo getAngulo que calcula el nuevo �ngulo de traslaci�n mediante una suma acumulativa del �ngulo actual m�s su velocidad de traslaci�n en cada iteraci�n, lo cual permite hacer el c�lculo de su posici�n relativa. La posici�n relativa ser� accesible mediante un m�todo accesor p�blico de modo que si un planeta posee sat�lite podr� pasar su posici�n relativa a la del satelite para que este se pueda dibujar rot�ndo sobre �l.</p>

<p>Para los c�lculos de la posici�n absoluta de la nave y de su trayectoria se ha utilizado la combinaci�n de las matrices de rotaci�n Y-X. La trayectoria es la suma acumulativa del resultado del producto del m�dulo de la velocidad por las componentes que a su vez son resultado de transformar el vector (0, 0, -1) mediante la combinaci�n de las matrices de rotaci�n.</p>

<p>Para la correcta visualizaci�n de las etiquetas se ha utilizado un procedimiento distinto para cada modo de visualizaci�n. En el modo panor�mico simplemente se deshace la rotaci�n del eje X que se le haya aplicado.</p>

<p>En el modo de visualizaci�n en primera persona y para la correcta orientaci�n de las etiquetas, se ha calculado el �ngulo mediante el producto escalar del vector (0, 0, 1), que es la direcci�n normal de la etiqueta, por el vector que une los puntos de la nave y cada planeta, despejando el �ngulo y aplicando el arcocoseno al producto vectorial dividido entre el producto de los m�dulos de los vectores. Para el c�lculo del �ngulo final de la etiqueta se ha despreciado la componente Y del vector nave-planeta en el c�lculo del m�dulo, ya que �ngulo que se busca es el que forma este vector con el plano XZ que pasa por el planeta.</p> 

<div align="center">
	<p><img src="./sistema_solar.gif" alt="Sistema solar interactivo 3D" /></p>
</div>

<p>Esta aplicaci�n se ha desarrollado como cuarta pr�ctica evaluable para la asignatura de "Creando Interfaces de Usuarios" de la menci�n de Computaci�n del grado de Ingenier�a Inform�tica de la Universidad de Las Palmas de Gran Canaria en el curso 2019/20 y en fecha de 08/3/2020 por el alumno Juan Sebasti�n Ram�rez Artiles.</p>

<p>Referencias a los recursos utilizados:</p>
<ul>
	<li>Textura Sol: "https://pixabay.com/es/illustrations/el-fondo-textura-el-sol-3d-1017060/"</li>
	<li>Textura Mercurio: "https://gruponexus.wordpress.com/2009/06/11/mercurio/"</li>
	<li>Textura Venus: "https://pxhere.com/es/photo/1262003?__cf_chl_jschl_tk__=5be6c88ab8d4c14ea30d9cfa03ac3a592246373c-1582116013-0-AYmbg47Dsx6x7QM6k9_FcjZhS6n8hWy1pbDBb3UscT1zbKQuFZEXGn_wcGAKhlL9XbAfWahNizzjJhFr1-yjOYuoXeeve_MW_l-g5fiKO2ILtkG5HMAeLBV0_QK021XbGc_X5lOAWrm4A-TRmqGUKaU9HcM8WxfoGI2i5M75cIH89iTiCL6N9XbACv2I7CacZ5QxiFta3zzP55Q6tX-G-hWTt7E4Hwt_hBVW17Ns0DTuDCz_z-6P4oRbZbtx7IocMXFzHoh4yQWx3CQKLonne6nhYmpbbUr-vXzSP1WGO-MZ"</li>
	<li>Textura Tierra: "https://es.123rf.com/photo_7005552_alta-resoluci%C3%B3n-de-la-planeta-tierra-pint%C3%B3-la-textura-.html"</li>
	<li>Textura Luna: "https://www.canstockphoto.es/superficie-seamless-textura-luna-35589436.html"</li>
	<li>Textura Marte: "https://es.123rf.com/photo_38509113_marte-ilustraci%C3%B3n-cient%C3%ADfica-textura-de-planeta-lejano-en-el-espacio-profundo.html"</li>
	<li>Textura J�piter: "https://josevicentediaz.com/2015/11/26/jupiter-en-4k-ultra-hd/"</li>
	<li>Textura Gan�medes: "https://pijamasurf.com/2015/03/un-viaje-a-traves-de-las-texturas-de-los-planetas-y-lunas-del-sistema-solar-fotos/"</li>
</ul>