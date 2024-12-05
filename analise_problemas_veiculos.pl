% analise_problemas_veiculos.pl
% Sistema Especialista para Análise de Problemas de Veículos
% Desenvolvido por: [Seu Nome Aqui]

% Base de Conhecimento
sintoma(motor_nao_liga).
sintoma(luzes_fracas).
sintoma(barulho_ao_frear).
sintoma(pedal_freio_macio).
sintoma(vazamento_oleo).

% Regras de diagnóstico
problema(bateria_fraca) :- 
    sintoma(motor_nao_liga), sintoma(luzes_fracas).

problema(freio_desgastado) :- 
    sintoma(barulho_ao_frear), sintoma(pedal_freio_macio).

problema(vazamento_de_oleo) :- 
    sintoma(vazamento_oleo).

% Função principal para diagnóstico
diagnostico :-
    write('Bem-vindo ao Sistema de Análise de Problemas de Veículos!'), nl,
    perguntar(motor_nao_liga),
    perguntar(luzes_fracas),
    perguntar(barulho_ao_frear),
    perguntar(pedal_freio_macio),
    perguntar(vazamento_oleo),
    (
        problema(Problema), !,
        format('Problema identificado: ~w~n', [Problema])
    ;
        write('Problema não identificado. Consulte um mecânico.'), nl
    ),
    nl, write('Desenvolvido por: [Seu Nome Aqui]').

perguntar(Sintoma) :-
    format('O veículo apresenta ~w? (sim/nao): ', [Sintoma]),
    read(Resposta),
    (Resposta == sim -> assertz(sintoma(Sintoma)) ; true).
