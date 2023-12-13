% Llamamiento inicial
bolillo:-	writeln('Hola bolillo, soy una IA que puede proporcionarte informacion sobre el Cancer de rinon y los campeones de la Champions al dia de hoy, es importante que todas las entradas deben ser en minusculas y con un "." al final'),
	readln(Input),
	bolillo(Input),!.


	% despedidas

	bolillo(Input):- Input == ['adios', '.'],
	writeln('Adios, espero haberte ayudado.'), !.
	bolillo(Input):- Input == ['Adios', '.'],
	writeln('Adios, espero haberte ayudado.'), !.
	bolillo(Input):- Input == ['Bye', '.'],
	writeln('Adios, espero haberte ayudado.'), !.
	bolillo(Input):- Input == ['bye', '.'],
	writeln('Adios, espero haberte ayudado.'), !.
	bolillo(Input):- Input == ['Fin', '.'],
	writeln('Adios, espero haberte ayudado.'), !.
	bolillo(Input):- Input == ['fin', '.'],
	writeln('Adios, espero haberte ayudado.'), !.



	bolillo(Input) :-
	template(Stim, Resp, IndStim),
	match(Stim, Input),
	% si he llegado aquí es que he
	% hallado el template correcto:
	replace0(IndStim, Input, 0, Resp, R),
	writeln(R),
	readln(Input1),
	bolillo(Input1), !.


	% saludos
	template([hola, soy, s(_), '.'], ['Hola', 0 ], [2]).
	template([hola, mi, nombre, es, s(_), '.'], ['Hola', 0, 'Como', estas, tu, '?'], [4]).
	template([buendia, mi, nombre, es, s(_), '.'], ['buen dia', 'Como', estas, tu, 0, '?'], [4]).
    template([hola, yo, soy, s(_), '.'], ['Hola', 0, espero, estes, teniendo, un, buen, dia], [3]).

	% templates interactivos base
	template([te, gustan, las, s(_), '.'], [flagLike], [3]).
	template([te, gustan, los, s(_), '.'], [flagLike], [3]).
	template([tu, sabes, s(_), '.'], [flagDo], [2]).
	template([eres, s(_), '.'], [flagIs], [1]).
	
	% TEMPLATES CANCER DE RINON
	template([cancer, de, rinion, '.'],['
El cancer de rinion, tambien conocido como carcinoma renal, se refiere a la formacion y crecimiento de celulas cancerosas en los riniones. Los riniones son organos en forma de frijol ubicados en la parte posterior del abdomen, uno a cada lado de la columna vertebral. Tienen la funcion principal de filtrar la sangre y eliminar los desechos en forma de orina.
En el caso del cancer de rinion, las celulas cancerosas pueden desarrollarse en los tubulos pequenos de los riniones, que son parte de la unidad funcional basica del rinon llamada nefrona. El tipo mas comun de cancer de riñon es el carcinoma de celulas renales, que puede tener subtipos como el carcinoma de celulas claras, el carcinoma de celulas papilares y otros.
Los factores de riesgo para el cancer de rinion incluyen antecedentes familiares de la enfermedad, tabaquismo, obesidad, hipertension arterial y ciertos trastornos geneticos. Puedo proporcionarte informacion sobre sus sintomas tambien si lo deseas'],[]).

	template([hablame, del, cancer, de, rinion, '.'],['El cancer de rinion, tambien conocido como carcinoma renal, se refiere a la formacion y crecimiento de celulas cancerosas en los riniones. Los riniones son organos en forma de frijol ubicados en la parte posterior del abdomen, uno a cada lado de la columna vertebral. Tienen la funcion principal de filtrar la sangre y eliminar los desechos en forma de orina.
En el caso del cancer de rinion, las celulas cancerosas pueden desarrollarse en los tubulos pequenos de los riniones, que son parte de la unidad funcional basica del rinon llamada nefrona. El tipo mas comun de cancer de riñon es el carcinoma de celulas renales, que puede tener subtipos como el carcinoma de celulas claras, el carcinoma de celulas papilares y otros.
Los factores de riesgo para el cancer de rinion incluyen antecedentes familiares de la enfermedad, tabaquismo, obesidad, hipertension arterial y ciertos trastornos geneticos. Puedo proporcionarte informacion sobre sus sintomas tambien si lo deseas.'],[]).

	template([que, es, el, cancer, de, rinion, '.'],['El cancer de rinion, tambien conocido como carcinoma renal, se refiere a la formacion y crecimiento de celulas cancerosas en los riniones. Los riniones son organos en forma de frijol ubicados en la parte posterior del abdomen, uno a cada lado de la columna vertebral. Tienen la funcion principal de filtrar la sangre y eliminar los desechos en forma de orina.
En el caso del cancer de rinion, las celulas cancerosas pueden desarrollarse en los tubulos pequenos de los riniones, que son parte de la unidad funcional basica del rinon llamada nefrona. El tipo mas comun de cancer de riñon es el carcinoma de celulas renales, que puede tener subtipos como el carcinoma de celulas claras, el carcinoma de celulas papilares y otros.
Los factores de riesgo para el cancer de rinion incluyen antecedentes familiares de la enfermedad, tabaquismo, obesidad, hipertension arterial y ciertos trastornos geneticos. Puedo proporcionarte informacion sobre sus sintomas tambien si lo deseas.'],[]).

    template([cuentame, sobre, el,  cancer, de, rinion, '.'],['El cancer de rinion, tambien conocido como carcinoma renal, se refiere a la formacion y crecimiento de celulas cancerosas en los riniones. Los riniones son organos en forma de frijol ubicados en la parte posterior del abdomen, uno a cada lado de la columna vertebral. Tienen la funcion principal de filtrar la sangre y eliminar los desechos en forma de orina.
En el caso del cancer de rinion, las celulas cancerosas pueden desarrollarse en los tubulos pequenos de los riniones, que son parte de la unidad funcional basica del rinon llamada nefrona. El tipo mas comun de cancer de riñon es el carcinoma de celulas renales, que puede tener subtipos como el carcinoma de celulas claras, el carcinoma de celulas papilares y otros.
Los factores de riesgo para el cancer de rinion incluyen antecedentes familiares de la enfermedad, tabaquismo, obesidad, hipertension arterial y ciertos trastornos geneticos. Puedo proporcionarte informacion sobre sus sintomas tambien si lo deseas.'],[]).
	
    % sintomas cancer de rinion
	template([sintomas], ListaResultado, []) :-
   	 	findall(Sintomas, sintoma_cancer_rinion(Sintomas), ListaResultado).
	
	template([sintomas, del, cancer, de, rinion], ListaResultado, []) :-
   	 	findall(Sintomas, sintoma_cancer_rinion(Sintomas), ListaResultado).

	template([cuales, son, los, sintomas, del, cancer, de, rinion], ListaResultado, []) :-
		findall(Sintomas, sintoma_cancer_rinion(Sintomas), ListaResultado).

	template([dime, los, sintomas, del, cancer, de, rinion], ListaResultado, []) :-
		findall(Sintomas, sintoma_cancer_rinion(Sintomas), ListaResultado).

	
	% causas del cancer de rinion
	template([cuales, son, las, causas], ListaResultado, []) :-
		findall(Causas, causa_cancer_rinion(Causas), ListaResultado).
	
	template([cuales, son, las, causas, del, cancer, de, rinion], ListaResultado, []) :-
		findall(Causas, causa_cancer_rinion(Causas), ListaResultado).

	template([cuales, pueden, ser, las, causas, del, cancer, de, rinion], ListaResultado, []) :-
		findall(Causas, causa_cancer_rinion(Causas), ListaResultado).

	template([dime, las, causas], ListaResultado, []) :-
		findall(Causas, causa_cancer_rinion(Causas), ListaResultado).
	
	template([dime, las, causas, del, cancer, de, rinion], ListaResultado, []) :-
		findall(Causas, causa_cancer_rinion(Causas), ListaResultado).
	
	template([causas], ListaResultado, []) :-
    	findall(Causas, causa_cancer_rinion(Causas), ListaResultado).
	
	template([causas, del, cancer, de, rinion], ListaResultado, []) :-
    	findall(Causas, causa_cancer_rinion(Causas), ListaResultado).

	% especialistas cancer de rinion
	template([con, quien, puedo, ir], ListaResultado, []) :-
		findall(Especialistas, especialista_cancer_rinion(Especialistas), ListaResultado).
	
	template([quien, me, puede, atender], ListaResultado, []) :-
		findall(Especialistas, especialista_cancer_rinion(Especialistas), ListaResultado).
	
	template([quien, atiende, el, cancer, de, rinion], ListaResultado, []) :-
		findall(Especialistas, especialista_cancer_rinion(Especialistas), ListaResultado).
	
	template([quienes, son, los, especialistas, del, cancer, de, rinion], ListaResultado, []) :-
		findall(Especialistas, especialista_cancer_rinion(Especialistas), ListaResultado).

	template([dime, los, especialistas], ListaResultado, []) :-
		findall(Especialistas, especialista_cancer_rinion(Especialistas), ListaResultado).
	
	template([especialistas], ListaResultado, []) :-
    	findall(Especialistas, especialista_cancer_rinion(Especialistas), ListaResultado).
	

	% medicamento cancer de rinion
	template([medicamento, '.'],['El uso de medicamentos especificos dependera de la situacion clinica y del tipo de cancer de rinion. Es importante destacar que solo un medico oncologo puede recetar o ajustar medicamentos segun las necesidades especificas de cada paciente. No se automedique .'],[]).

    template([medicamento, para, el, cancer, de, rinion, '.'],['El uso de medicamentos especificos dependera de la situacion clinica y del tipo de cancer de rinion. Es importante destacar que solo un medico oncologo puede recetar o ajustar medicamentos segun las necesidades especificas de cada paciente. No se automedique .'],[]).

    template([cual, medicamento, puedo, tomar, '.'],['El uso de medicamentos especificos dependera de la situacion clinica y del tipo de cancer de rinion. Es importante destacar que solo un medico oncologo puede recetar o ajustar medicamentos segun las necesidades especificas de cada paciente. No se automedique .'],[]).
 
    template([puedo, tomar, medicamento, '.'],['El uso de medicamentos especificos dependera de la situacion clinica y del tipo de cancer de rinion. Es importante destacar que solo un medico oncologo puede recetar o ajustar medicamentos segun las necesidades especificas de cada paciente. No se automedique .'],[]).


	% tratamiento cancer de rinion
	template([tratamiento], ListaResultado, []):-
		findall(Tratamientos, tratamiento_cancer_rinion(Tratamientos), ListaResultado).
	
	template([dime, el, tratamiento], ListaResultado, []):-
		findall(Tratamientos, tratamiento_cancer_rinion(Tratamientos), ListaResultado).

	template([dime, el, tratamiento, para, el, cancer, de, rinion], ListaResultado, []):-
		findall(Tratamientos, tratamiento_cancer_rinion(Tratamientos), ListaResultado).

	template([cual, es, el, tratamiento], ListaResultado, []):-
		findall(Tratamientos, tratamiento_cancer_rinion(Tratamientos), ListaResultado).

	template([cual, es, el, tratamiento, para, el, cancer, de, rinion], ListaResultado, []):-
		findall(Tratamientos, tratamiento_cancer_rinion(Tratamientos), ListaResultado).

	template([como, se, trata, al, cancer, de, rinion], ListaResultado, []):-
		findall(Tratamientos, tratamiento_cancer_rinion(Tratamientos), ListaResultado).
	

	% templates comparativos
	template([s(_), es, un, sintoma], [flagSintoma], [0]).
	template([s(_), 'y' , (_), 'y' , (_), es, un, sintoma,'.'], [flagMuchosSintomas], [0,2,4]).
	template([s(_), es, una, causa], [flagCausas], [0]).
	template([s(_), es, un, especialista], [flagEspecialista], [0]).
	

	% Hechos y flag de causas del cancer de rinion
	causasIs(X, R):- causa_cancer_rinion(X), R = [si, X, es, una, causa, del, cancer, de, rinion].
    causasIs(X, R):- \+causa_cancer_rinion(X), R = [X, no, es, una, causa, del, cancer, de, rinion].
	causa_cancer_rinion('Tabaquismo').
	causa_cancer_rinion('Obesidad').
	causa_cancer_rinion('Factores_geneticos_y_hereditarios').
	causa_cancer_rinion('Hipertension_arterial').
    causa_cancer_rinion('Exposicion_prolongada_a_productos_quimicos').

	% Hechos y flag de sintomas del cancer de rinion
	sintomaIs(X, R):- sintoma_cancer_rinion(X), R = [si, X, es, un, sintoma, del, cancer, de, rinion].
    sintomaIs(X, R):- \+sintoma_cancer_rinion(X), R = [X, no, es, un, sintoma, del, cancer, de, rinion].
	sintoma_cancer_rinion('Sangre_en_la_orina').
	sintoma_cancer_rinion('Dolor_en_el_costado_o_en_la_parte_baja_de_la_espalda').
	sintoma_cancer_rinion('Masa_o_bulto_abdominal').
	sintoma_cancer_rinion('Perdida_de_peso_inexplicada').
	sintoma_cancer_rinion('Fatiga').
	sintoma_cancer_rinion('Fiebre_y_sudoracion_nocturna').

muchossintomaIs(X,Y,Z, R):- sintomas_cancer(X,Y,Z), R = [si, X, Y, y, Z, son, sintomas, del, cancer, de, rinion].
    muchossintomaIs(X,Y,Z, R):- \+sintomas_cancer(X,Y,Z), R = [X, Y, y, Z, no, son,  sintomas, del, cancer, de, rinion].
    sintomas_cancer('Sangre_en_la_orina', 'Fatiga', 'Fiebre_y_sudoracion_nocturna').
    sintomas_cancer('Sangre_en_la_orina', 'Dolor_en_el_costado_o_en_la_parte_baja_de_la_espalda', 'Perdida_de_peso_inexplicada').
	sintomas_cancer('Fatiga', 'Sangre_en_la_orina', 'Masa_o_bulto_abdominal').
	sintomas_cancer('Perdida_de_peso_inexplicada','Fatiga','Sangre_en_la_orina').
	sintomas_cancer('Masa_o_bulto_abdominal','Dolor_en_el_costado_o_en_la_parte_baja_de_la_espalda','Fatiga').


	

	
	% Hechos y flag de especialistas
	especialistaIs(X, R):- especialista_cancer_rinion(X), R = [si, X, es, un, especialista, apto, para, el, cancer, de, rinion].
    especialistaIs(X, R):- \+especialista_cancer_rinion(X), R = [X, no, es, un, especialista, apto, para, el, cancer, de, rinion].
	especialista_cancer_rinion('Oncologo').
	especialista_cancer_rinion('Cirujano_oncologico').
	especialista_cancer_rinion('Radioterapeuta').
	especialista_cancer_rinion('Radiologo').
    especialista_cancer_rinion('Patologo').
    especialista_cancer_rinion('Enfermero_oncologico').
    especialista_cancer_rinion('Psicooncologo').
	especialista_cancer_rinion('Nutricionista').

	
    % Hechos del tratamiento 
	tratamiento_cancer_rinion('Inmunoterapia').
	tratamiento_cancer_rinion('Terapias_dirigidas').
	tratamiento_cancer_rinion('Quimioterapias').
	tratamiento_cancer_rinion('Terapia_hormonal').
	tratamiento_cancer_rinion('Medicamentos_para_aliviar_sintomas').
	
finalPartido(X, R) :-
finalPartidos(X),
( 
X = 1956, R = ['Copa de Europa-Real Madrid 4-3 Stade Reims.'];
X = 1957, R = ['Copa de Europa-Real Madrid 2-0 Fiorentina.'];
X = 1958, R = ['Copa de Europa-Real Madrid 3-2 AC Milan', 'El partido termino en tiempos extras.'];
X = 1959, R = ['Copa de Europa-Real Madrid 2-0 Stade Reims.'];	          
X = 1960, R = ['Copa de Europa-Real Madrid 7-3 Eintracht Frankfurt.'];
X = 1961, R = ['Copa de Europa-Benfica 3-2 Barcelona.'];
X = 1962, R = ['Copa de Europa-Benfica 5-3 Real Madrid.'];
X = 1963, R = ['Copa de Europa-AC Milan 2-1 Benfica.'];
X = 1964, R = ['Copa de Europa-Inter Milan 3-1 Real Madrid.'];
X = 1965, R = ['Copa de Europa-Inter Milan 1-0 Benfica.'];
X = 1966, R = ['Copa de Europa-Real Madrid 2-1 Partizan Belgrado'];
X = 1967, R = ['Copa de Europa-Celtic Glasgow 2-1 Inter Milan.'];
X = 1968, R = ['Copa de Europa-Manchester United 4-1 Benfica.','El Partido se definio en tiempos extras'];
X = 1969, R = ['Copa de Europa-AC Milan 4-1 Ajax.'];
X = 1970, R = ['Copa de Europa-Feyenoord 2-1 Celtic Glasgow.','El Partido se definio en tiempos extras'];
X = 1971, R = ['Copa de Europa-Ajax 2-0 Panathinaikos.'];
X = 1972, R = ['Copa de Europa-Ajax 2-0 Inter Milan.'];
X = 1973, R = ['Copa de Europa-Ajax 1-0 Juventus.'];
X = 1974, R = ['Copa de Europa-Bayern Munchen 1-1 Atletico.','4-0 favor Bayern Munchen en partido de desempate'];
X = 1975, R = ['Copa de Europa-Bayern Munchen 2-0 Leed United.'];
X = 1976, R = ['Copa de Europa-Bayern Munchen 1-0 St.Etienne.'];
X = 1977, R = ['Copa de Europa-Liverpool 3-1 Borussia Mongengladbach.'];
X = 1978, R = ['Copa de Europa-Liverpool 1-0 Brujas.'];
X = 1979, R = ['Copa de Europa-Nothingham Forest 1-0 Malmo.'];
X = 1980, R = ['Copa de Europa-Nothingham Forest 1-0 Hamburgo.'];
X = 1981, R = ['Copa de Europa-Liverpool 1-0 Real Madrid.'];
X = 1982, R = ['Copa de Europa-Aston Villa 1-0 Bayern Munchen.'];
X = 1983, R = ['Copa de Europa-Hamburgo 1-0 Juventus.'];
X = 1984, R = ['Copa de Europa-Liverpool 1-1 Roma','4-2 para Liverpool en tanda de penaltis'];
X = 1985, R = ['Copa de Europa-Juventus 1-0 Liverpool.'];
X = 1986, R = ['Copa de Europa-Steaua Bucarest 0-0 Barcelona','2-0 para Steaua Bucarest en tanda de penaltis'];
X = 1987, R = ['Copa de Europa-Porto 2-1 Bayern Munchen.'];
X = 1988, R = ['Copa de Europa-PSV 0-0 Benfica.','6-5 para PSV en tanda de penaltis.'];
X = 1989, R = ['Copa de Europa-AC Milan 4-0 Steaua Bucarest.'];
X = 1990, R = ['Copa de Europa-AC Milan 1-0 Benfica.'];
X = 1991, R = ['Copa de Europa-Estrella Roja 0-0 Marsella.','5-3 para Estrella Roja en penaltis.'];
X = 1992, R = ['Copa de Europa-Barcelona 1-0 Sampdoria.'];
X = 1993, R = ['Champions League-Olympique de Marsella 1-0 AC Milan.'];
X = 1994, R = ['Champions League-AC Milan 4-0 Barcelona.'];
X = 1995, R = ['Champions League-Ajax 1-0 AC Milan.'];
X = 1996, R = ['Champions League-Jueventus 1-1 Ajax.','4-2 para el Juventus en tanda de penaltis'];
X = 1997, R = ['Champions League-Borussia Dortmund 3-1 Juventus.'];
X = 1998, R = ['Champions League-Real Madrid 1-0 Juventus.'];
X = 1999, R = ['Champions League-Manchester United 2-1 Bayern Munchen.'];
X = 2000, R = ['Champions League-Real Madrid 3-0 Valencia.'];
X = 2001, R = ['Champions League-Bayern Munchen 1-1 Valencia','5-4 para Bayern Munchen en tanda de penaltis.'];
X = 2002, R = ['Champions League-Real Madrid 2-1 Bayern Leverkusen.'];
X = 2003, R = ['Champions League-AC Milan 0-0 Juventus','3-2 para AC Milan en tanda de penaltis'];
X = 2004, R = ['Champions League-Porto 3-0 Monaco.'];
X = 2005, R = ['Champions League-Liverpool 3-3 AC Milan','3-2 para Liverpool en tanda de penaltis'];
X = 2006, R = ['Champions League-Barcelona 2-1 Arsenal.'];
X = 2007, R = ['Champions League-AC Milan 2-1 Liverpool.'];
X = 2008, R = ['Champions League-Manchester United 1-1 Chelsea','6-5 para Manchester United en tanda de penaltis'];
X = 2009, R = ['Champions League-Barcelona 2-0 Manchester United.'];
X = 2010, R = ['Champions League-Inter Milan 2-0 Bayern Munchen.'];
X = 2011, R = ['Champions League-Barcelona 3-1 Manchester United.'];
X = 2012, R = ['Champions League-Chelsea 1-1 Bayern Munchen','4-3 para Chelsea en tanda de penaltis.'];
X = 2013, R = ['Champions League-Bayern Munchen 2-1 Borussia Dortmund.'];
X = 2014, R = ['Champions League-Real Madrid 4-1 Atletico de Madrid','El partido se definiop en tiempos extras.'];
X = 2015, R = ['Champions League-Barcelona 3-1 AC Juventus.'];
X = 2016, R = ['Champions League-Real Madrid 1-1 Atletico de Madrid','5-3 para el Real Madrid en tanda de penaltis'];
X = 2017, R = ['Champions League-Real Madrid 4-1 Juventus.'];
X = 2018, R = ['Champions League-Real Madrid 3-1 Liverpool.'];
X = 2019, R = ['Champions League-Tottenham 0-2 Juventus.'];
X = 2020, R = ['Champions League-PSG 0-1 Bayern Munchen.'];
X = 2021, R = ['Champions League-Manchester City 0-1 Chelsea.'];
X = 2022, R = ['Champions League-Real Madrid 1-0 Liverpool.'];
X = 2023, R = ['Champions League-Manchester City 1-0 Inter Milan.'];



R = ['puede ser que', X, ' no halla habido campeon de la libertadores']
). 



finalPartido(X, R):- \+finalPartidos(X), R = ['creo que en el anion de', X, 'no hubo champions o copa de europa , lo siento'].
finalPartidos(1956).
finalPartidos(1957).
finalPartidos(1958).
finalPartidos(1959).
finalPartidos(1960).
finalPartidos(1961).
finalPartidos(1962).
finalPartidos(1963).
finalPartidos(1964).
finalPartidos(1965).
finalPartidos(1966).
finalPartidos(1967).
finalPartidos(1968).
finalPartidos(1969).
finalPartidos(1970).
finalPartidos(1971).
finalPartidos(1972).
finalPartidos(1973).
finalPartidos(1974).
finalPartidos(1975).
finalPartidos(1976).
finalPartidos(1977).
finalPartidos(1978).
finalPartidos(1979).
finalPartidos(1980).
finalPartidos(1981).
finalPartidos(1982).
finalPartidos(1983).
finalPartidos(1984).
finalPartidos(1985).
finalPartidos(1986).
finalPartidos(1987).
finalPartidos(1988).
finalPartidos(1989).
finalPartidos(1990).
finalPartidos(1991).
finalPartidos(1992).
finalPartidos(1993).
finalPartidos(1994).
finalPartidos(1995).
finalPartidos(1996).
finalPartidos(1997).
finalPartidos(1998).
finalPartidos(1999).
finalPartidos(2000).
finalPartidos(2001).
finalPartidos(2002).
finalPartidos(2003).
finalPartidos(2004).
finalPartidos(2005).
finalPartidos(2006).
finalPartidos(2007).
finalPartidos(2008).
finalPartidos(2009).
finalPartidos(2010).
finalPartidos(2011).
finalPartidos(2012).
finalPartidos(2013).
finalPartidos(2014).
finalPartidos(2015).
finalPartidos(2016).
finalPartidos(2017).
finalPartidos(2018).
finalPartidos(2019).
finalPartidos(2020).
finalPartidos(2021).
finalPartidos(2022).
finalPartidos(2023).




	% CAMPEONES DE LA CHAMPIONS LEAGUE

	template([que, es, la, champions, league], ['La UEFA Champions League es la principal competicion de clubes de futbol a nivel europeo y una de las mas prestigiosas del mundo. Es organizada por la Union de Asociaciones Europeas de Futbol (UEFA) y se celebra anualmente. '], []).
	template([hablame, del, torneo], ['La UEFA Champions League es la principal competicion de clubes de futbol a nivel europeo y una de las mas prestigiosas del mundo. Es organizada por la Union de Asociaciones Europeas de Futbol (UEFA) y se celebra anualmente.'], []).
	template([que, es, la, copa, de, europa], ['La Copa de Europa fue el precursor directo de la actual UEFA Champions League. Fue un torneo de futbol de clubes europeos que existio antes de que se estableciera la Union de Asociaciones Europeas de Futbol (UEFA) y se organizara la Champions League. La Copa de Europa se introdujo en la temporada 1955-1956 y fue la primera competicion de clubes a nivel europeo. '], []).
	template([en, que, consiste, el, torneo], ['La competicion comienza con una fase de clasificacion en la que participan clubes de toda Europa. Los equipos avanzan a traves de varias rondas eliminatorias hasta llegar a la fase de grupos, donde se dividen en grupos de cuatro equipos. Los dos primeros equipos de cada grupo avanzan a la fase de eliminacion directa, que incluye octavos de final, cuartos de final, semifinales y la final. '], []).
	template([cuantos, equipos, participan], ['En la actualidad, el formato de la Champions League incluye una fase de clasificacion y una fase de grupos. En la fase de grupos, 32 equipos estan divididos en ocho grupos de cuatro equipos cada uno. Los dos primeros equipos de cada grupo avanzan a las eliminatorias directas, que incluyen octavos de final, cuartos de final, semifinales y la final. '], []).
	template([quien, es, el, maximo, goleador, del, torneo, actualmente], ['Cristiano Ronaldo es el maximo goleador historico de la UEFA Champions League. Ronaldo, un delantero portugues, ha tenido una carrera excepcional en la competicion, anotando numerosos goles con el Manchester United, el Real Madrid y la Juventus.'], []).
	template([quien, es, el, equipo, mas, campeon, del, torneo, actualmente], [' Real Madrid es el equipo mas ganador en la historia de la UEFA Champions League. El Real Madrid ha ganado el titulo en multiples ocasiones y ha demostrado ser uno de los clubes mas exitosos en la competicion.'], []).
	template([quien, es, el, maximo, asistidor, del, torneo, actualmente], ['El record del maximo asistente en la historia de la UEFA Champions League pertenece a Lionel Messi, un futbolista argentino. Messi ha tenido una destacada carrera con el FC Barcelona y, hasta ese momento, habia contribuido significativamente tanto en la anotacion como en la asistencia de goles en la competicion.'], []).
	template([quien, es, el, jugador, que, ha, ganado, mas, champions], ['El jugador con mas titulos de la UEFA Champions League es Cristiano Ronaldo. El futbolista portugues ha ganado la Champions League en varias ocasiones durante su carrera.
Cristiano Ronaldo ha conseguido multiples titulos de la Champions League con dos clubes diferentes'], []).
    template([en, que, consiste, la, fase, de,  clasificacion], ['La Champions League comienza con una fase de clasificacion que involucra a equipos de asociaciones nacionales de futbol de toda Europa. Los equipos compiten en rondas eliminatorias para asegurar un lugar en la fase de grupos.'], []).
	template([en, que, consiste, la, fase, de,  grupos], ['Una vez completada la fase de clasificacion, los equipos se distribuyen en ocho grupos de cuatro equipos cada uno. Cada equipo juega un partido de ida y vuelta contra los otros tres equipos de su grupo. Los dos mejores equipos de cada grupo avanzan a la siguiente fase.'], []).
	template([en, que, consiste, la, fase, de,  eliminacion, directa], ['Despues de la fase de grupos, comienzan las eliminatorias directas. Los equipos clasificados se enfrentan en partidos de ida y vuelta en las rondas de octavos de final, cuartos de final y semifinales. Los ganadores avanzan a la siguiente fase, mientras que los perdedores son eliminados.'], []).
    template([en, que, consiste, la, final, del, torneo], ['Los dos equipos que superan las semifinales se encuentran en la final de la UEFA Champions League. La final es un partido unico que se juega en un estadio predeterminado, que puede cambiar cada anio. El equipo ganador de la final se corona campeon de la Champions League.'], []).

	% campeones de Champions league
	
	
	template([dime, los, campeones, de, la, edicion, champions, league], ListaResultado, []):-
		findall(Campeon_champions, campeon_champions(Campeon_champions), ListaResultado).
	
	template([cuales, son, campeones, de, champions, league], ListaResultado, []):-
		findall(Campeon_champions, campeon_champions(Campeon_champions), ListaResultado).

	template([campeones, de, champions, league], ListaResultado, []):-
		findall(Campeon_champions, campeon_champions(Campeon_champions), ListaResultado).


	% campeones de copa de europa
	
	template([dime, los, campeones, de, la, edicion, copa, de, europa], ListaResultado, []):-
		findall(Campeon_copa, campeon_copa(Campeon_copa), ListaResultado).
	
	template([cuales, son, los, campeones, de, la, copa, de, europa], ListaResultado, []):-
		findall(Campeon_copa, campeon_copa(Campeon_copa), ListaResultado).

	template([campeones, de, la, copa, de, europa], ListaResultado, []):-
		findall(Campeon_copa, campeon_copa(Campeon_copa), ListaResultado).
	
    % anios
    template([que, puedes, decir, anio, s(), _], [flag6], [4]).	

	
    % templates comparativos
	
    template([s(_), es, un, campeon, de, la, edicion, Champions, League], [flagcampeon_champions], [0]).
    template([s(_), es, un, campeon, de, la. edicion, copa, de, europa], [flagcampeon_copa], [0]).


	% templates default
	template(_, ['No es algo que yo entienda, formulalo de mejor forma para ayudarte'], []). 



	% campeones de champions
	campeon_championsIs(X, R):- campeon_champions(X), R = [si, X, es, un, campeon, de, champions].
	campeon_championsIs(X, R):- \+campeon_champions(X), R = [X, no, es, un, campeon, de, champions].
	campeon_champions('Manchester_City_2023').
	campeon_champions('Real_Madrid_2022').
	campeon_champions('Chelsea_2021').
	campeon_champions('Bayer_Munchen_2020').
	campeon_champions('Liverpool_2019').
	campeon_champions('Real_Madrid_2018').
	campeon_champions('Real_Madrid_2017').
	campeon_champions('Real_Madrid_2016').
	campeon_champions('Barcelona_2015').
	campeon_champions('Real_Madrid_2014').
	campeon_champions('Bayern_Munchen_2013').
	campeon_champions('Chelsea_2012').
	campeon_champions('Barcelona_2011').
	campeon_champions('Inter_Milan_2010').
	campeon_champions('Barcelona_2009').
	campeon_champions('Manchester_United_2008').
	campeon_champions('AC_Milan_2007').
	campeon_champions('Barcelona_2006').
	campeon_champions('Liverpool_2005').
	campeon_champions('Porto_2004').
	campeon_champions('AC_Milan_2003').
	campeon_champions('Real_Madrid_2002').
	campeon_champions('Bayern_Munchen_2001').
	campeon_champions('Real_Madrid_2000').
	campeon_champions('Manchester_United_1999').
	campeon_champions('Real_Madrid_1998').
	campeon_champions('Borussia_Dortmund_1997').
	campeon_champions('Juventus_1996').
	campeon_champions('Ajax_1995').
	campeon_champions('AC_Milan_1994').
	campeon_champions('Olympique_Marsella_1993').
	




	% campeones copa de europa
	campeon_copaIs(X, R):- campeon_copa(X), R = [si, X, es, un, campeon, de, ciudad, de, bandel].
	campeon_copaIs(X, R):- \+campeon_copa(X), R = [X, no, es, un, campeon, de, la, ciudad, de, bandel].
	campeon_copa('Barcelona_1992').
	campeon_copa('Estrella_Roja_1991').
	campeon_copa('AC_Milan_1990').
	campeon_copa('AC_Milan_1989').
	campeon_copa('PSV_1988').
	campeon_copa('Porto_1987').
	campeon_copa('Steaua_Bucarest_1986').
	campeon_copa('Juventus_1985').
	campeon_copa('Liverpool_1984').
	campeon_copa('Hamburgo_1983').
	campeon_copa('Aston_Villa_1982').
	campeon_copa('Liverpool_1981').
	campeon_copa('Nothingham_Forest_1980').
	campeon_copa('Liverpool_1978').
	campeon_copa('Liverpool_1977').
	campeon_copa('Bayern_Munchen_1976').
	campeon_copa('Bayern_Munchen_1975').
	campeon_copa('Bayern_Munchen_1974').
	campeon_copa('Ajax_1973').
	campeon_copa('Ajax_1972').
	campeon_copa('Ajax_1971').
	campeon_copa('Feyenoord_1970').
	campeon_copa('AC_Milan_1969').
	campeon_copa('Manchester_United_1968').
	campeon_copa('Celtic_Glasgow_1967').
	campeon_copa('Real_Madrid_1966').
	campeon_copa('Inter_Milan_1965').
    campeon_copa('Inter_Milan_1964').
	campeon_copa('AC_Milan_1963').
	campeon_copa('Benfica_1962').
	campeon_copa('Benfica_1961').
	campeon_copa('Real_Madrid_1960').
	campeon_copa('Real_Madrid_1959').
	campeon_copa('Real_Madrid_1958').
	campeon_copa('Real_Madrid_1957').
	campeon_copa('Real_Madrid_1956').


	% Lo que le gusta a bolillo : flagLike
	bolilloLikes(X, R):- likes(X), R = [si, me, gusta, X].
	bolilloLikes(X, R):- \+likes(X), R = [X, no, me, gusta].
	likes(apples).
	likes(ponies).
	likes(zombies).
	likes(manzanas).
	likes(computadoras).
	like(carros).

	% lo que hace bolillo: flagDo
	bolilloDoes(X, R):- does(X), R = [si, yo, X].
	bolilloDoes(X, R):- \+does(X), R = [X, no, yo, no, lo, hago].
	does(study).
	does(cook).
	does(work).

	% lo que es bolillo: flagIs
	bolilloIs(X, R):- is0(X), R = [si, soy, X].
	bolilloIs(X, R):- \+is0(X), R = [no, soy, X].
	is0(dumb).
	is0(weird).
	is0(nice).
	is0(fine).
	is0(happy).
	is0(redundant).

	match([],[]).
	match([], _):- true.

	match([S|Stim],[I|Input]) :-
		atom(S), % si I es un s(X) devuelve falso
		S == I,
		match(Stim, Input),!.

	match([S|Stim],[_|Input]) :-
	% I es un s(X), lo ignoro y continúo con el resto de la lista
		\+atom(S),
		match(Stim, Input),!.

	replace0([], _, _, Resp, R):- append(Resp, [], R),!.

	% bolillo likes:
	replace0([I|_], Input, _, Resp, R):-
		nth0(I, Input, Atom),
		nth0(0, Resp, X),
		X == flagLike,
		bolilloLikes(Atom, R).

	% bolillo does:
	replace0([I|_], Input, _, Resp, R):-
		nth0(I, Input, Atom),
		nth0(0, Resp, X),
		X == flagDo,
		bolilloDoes(Atom, R).

	% bolillo is:
	replace0([I|_], Input, _, Resp, R):-
		nth0(I, Input, Atom),
		nth0(0, Resp, X),
		X == flagIs,
		bolilloIs(Atom, R).

	replace0([I|Index], Input, N, Resp, R):-
		length(Index, M), M =:= 0,
		nth0(I, Input, Atom),
		select(N, Resp, Atom, R1), append(R1, [], R),!.

	replace0([I|Index], Input, N, Resp, R):-
		nth0(I, Input, Atom),
		length(Index, M), M > 0,
		select(N, Resp, Atom, R1),
		N1 is N + 1,
		replace0(Index, Input, N1, R1, R),!.

	

	% champions FLAGS
    % champions
	replace0([I|_], Input, _, Resp, R):-
		nth0(I, Input, Atom),
		nth0(0, Resp, X),
		X == flagchampions,
		championsIs(Atom, R).

	% campeon champions
	replace0([I|_], Input, _, Resp, R):-
		nth0(I, Input, Atom),
		nth0(0, Resp, X),
		X == flagcampeon_champions,
		campeon_championsIs(Atom, R).

    % copa de europa
	replace0([I|_], Input, _, Resp, R):-
		nth0(I, Input, Atom),
		nth0(0, Resp, X),
		X == flagcampeon_copa,
		campeon_copaIs(Atom, R).

	% anios
	replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom), 
	nth0(0, Resp, X),
	X == flag6, 
	finalPartido(Atom, R).

	
% cancer de rinion Sintomas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagSintoma,
    sintomaIs(Atom, R).

replace0([I,J,K|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagMuchosSintomas,
	nth0(J, Input, Atom2),
    nth0(0, Resp, Y),
    Y == flagMuchosSintomas,
	nth0(K, Input, Atom3),
    nth0(0, Resp, Z),
    Z == flagMuchosSintomas,
    muchossintomaIs(Atom, Atom2, Atom3, R).


% cancer de rinion Causas:
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagCausas,
    causasIs(Atom, R).

% cancer rinion Especialista
replace0([I|_], Input, _, Resp, R):-
    nth0(I, Input, Atom),
    nth0(0, Resp, X),
    X == flagEspecialista,
    especialistaIs(Atom, R).