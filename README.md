<h1>Sistema solar:</h1>

<p>Este proyecto es una extensión del anterior, en el que se generó una simulación del sistema solar. La novedad en este trabajo es la introducción de una nave capaz de viajar a través del sistema. El objetivo que se buscaba con esto era la utilización de una cámara que se moviese junto con la nave y que proporcionase al usuario una visión en primera persona.</p>

<h2>Controles</h2>

<p>El usuario puede hacer uso de las teclas de dirección para orientar la nave y de las teclas de aceleración (a) y frenado (f) de la misma. También puede utilizar la tecla (c) para cambiar de modo de visualización, pasando alternativamente de la visión panorámica a la visión en primera persona.</p>

<p>La visión panorámica se puede rotar hacia arriba (u) y hacia abajo (d), esta funcionalidad sólo permanece activa en el modo de visualización panorámico. Como en el anterior trabajo se ha mantenido la función de pausa la cual se activa con la tecla (espacio).</p>

<h2>Detalles de implementación</h2>

<p>La aplicación se ha realizado en Processing y en ella se ha utilizado los métodos pushMatrix, popMatrix, rotate y translate, ya introducidos en la anterior práctica, y como novedad se ha hecho uso del método camera. Este método es el que posibilita cambiar la perspectiva del usuario y navegar por el sistema planetario.</p>

<p>En la generación de los planetas y satélites se ha hecho uso de una clase que posee como atributos principales: el radio del planeta, el radio de la órbita, la velocidad de traslación, la velocidad de rotación y la posición inicial dentro de su órbita que se generará aleatóriamente.</p>

<p>Además, esta clase contiene el método getAngulo que calcula el nuevo ángulo de traslación mediante una suma acumulativa del ángulo actual más su velocidad de traslación en cada iteración, lo cual permite hacer el cálculo de su posición relativa. La posición relativa será accesible mediante un método accesor público de modo que si un planeta posee satélite podrá pasar su posición relativa a la del satelite para que este se pueda dibujar rotándo sobre él.</p>

<p>Para los cálculos de la posición absoluta de la nave y de su trayectoria se ha utilizado la combinación de las matrices de rotación Y-X. La trayectoria es la suma acumulativa del resultado del producto del módulo de la velocidad por las componentes que a su vez son resultado de transformar el vector (0, 0, -1) mediante la combinación de las matrices de rotación.</p>

<p>Para la correcta visualización de las etiquetas se ha utilizado un procedimiento distinto para cada modo de visualización. En el modo panorámico simplemente se deshace la rotación del eje X que se le haya aplicado.</p>

<p>En el modo de visualización en primera persona y para la correcta orientación de las etiquetas, se ha calculado el ángulo mediante el producto escalar del vector (0, 0, 1), que es la dirección normal de la etiqueta, por el vector que une los puntos de la nave y cada planeta, despejando el ángulo y aplicando el arcocoseno al producto vectorial dividido entre el producto de los módulos de los vectores. Para el cálculo del ángulo final de la etiqueta se ha despreciado la componente Y del vector nave-planeta en el cálculo del módulo, ya que ángulo que se busca es el que forma este vector con el plano XZ que pasa por el planeta.</p> 

<div align="center">
	<p><img src="./sistema_solar.gif" alt="Sistema solar interactivo 3D" /></p>
</div>

<p>Esta aplicación se ha desarrollado como cuarta práctica evaluable para la asignatura de "Creando Interfaces de Usuarios" de la mención de Computación del grado de Ingeniería Informática de la Universidad de Las Palmas de Gran Canaria en el curso 2019/20 y en fecha de 08/3/2020 por el alumno Juan Sebastián Ramírez Artiles.</p>

<p>Referencias a los recursos utilizados:</p>
<ul>
	<li>Textura Sol: "https://pixabay.com/es/illustrations/el-fondo-textura-el-sol-3d-1017060/"</li>
	<li>Textura Mercurio: "https://gruponexus.wordpress.com/2009/06/11/mercurio/"</li>
	<li>Textura Venus: "https://pxhere.com/es/photo/1262003?__cf_chl_jschl_tk__=5be6c88ab8d4c14ea30d9cfa03ac3a592246373c-1582116013-0-AYmbg47Dsx6x7QM6k9_FcjZhS6n8hWy1pbDBb3UscT1zbKQuFZEXGn_wcGAKhlL9XbAfWahNizzjJhFr1-yjOYuoXeeve_MW_l-g5fiKO2ILtkG5HMAeLBV0_QK021XbGc_X5lOAWrm4A-TRmqGUKaU9HcM8WxfoGI2i5M75cIH89iTiCL6N9XbACv2I7CacZ5QxiFta3zzP55Q6tX-G-hWTt7E4Hwt_hBVW17Ns0DTuDCz_z-6P4oRbZbtx7IocMXFzHoh4yQWx3CQKLonne6nhYmpbbUr-vXzSP1WGO-MZ"</li>
	<li>Textura Tierra: "https://es.123rf.com/photo_7005552_alta-resoluci%C3%B3n-de-la-planeta-tierra-pint%C3%B3-la-textura-.html"</li>
	<li>Textura Luna: "https://www.canstockphoto.es/superficie-seamless-textura-luna-35589436.html"</li>
	<li>Textura Marte: "https://es.123rf.com/photo_38509113_marte-ilustraci%C3%B3n-cient%C3%ADfica-textura-de-planeta-lejano-en-el-espacio-profundo.html"</li>
	<li>Textura Júpiter: "https://josevicentediaz.com/2015/11/26/jupiter-en-4k-ultra-hd/"</li>
	<li>Textura Ganímedes: "https://pijamasurf.com/2015/03/un-viaje-a-traves-de-las-texturas-de-los-planetas-y-lunas-del-sistema-solar-fotos/"</li>
</ul>