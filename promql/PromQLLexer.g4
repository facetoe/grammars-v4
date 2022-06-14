/*
 [The "BSD licence"]
 Copyright (c) 2013 Terence Parr
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.
 3. The name of the author may not be used to endorse or promote products
    derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
 INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
 NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
 THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

lexer grammar PromQLLexer;

NUMBER: [0-9]+ ('.' [0-9]+)?;

STRING
    : '\'' (~('\'' | '\\') | '\\' .)* '\''
    | '"' (~('"' | '\\') | '\\' .)* '"'
    ;

// Binary operators

ADD:  '+';
SUB:  '-';
MULT: '*';
DIV:  '/';
MOD:  '%';
POW:  '^';

AND:    ('a'|'A')('n'|'N')('d'|'D');
OR:     ('o'|'O')('r'|'R');
UNLESS: ('u'|'U')('n'|'N')('l'|'L')('e'|'E')('s'|'S')('s'|'S');


// Comparison operators

EQ:  '=';
DEQ: '==';
NE:  '!=';
GT:  '>';
LT:  '<';
GE:  '>=';
LE:  '<=';
RE:  '=~';
NRE: '!~';

// Aggregation modifiers

BY:         ('b'|'B')('y'|'Y');
WITHOUT:    ('w'|'W')('i'|'I')('t'|'T')('h'|'H')('o'|'O')('u'|'U')('t'|'T');

// Join modifiers

ON:             ('o'|'O')('n'|'N');
IGNORING:       ('i'|'I')('g'|'G')('n'|'N')('o'|'O')('r'|'R')('i'|'I')('n'|'N')('g'|'G');
GROUP_LEFT:     ('g'|'G')('r'|'R')('o'|'O')('u'|'U')('p'|'P')'_'('l'|'L')('e'|'E')('f'|'F')('t'|'T');
GROUP_RIGHT:    ('g'|'G')('r'|'R')('o'|'O')('u'|'U')('p'|'P')'_'('r'|'R')('i'|'I')('g'|'G')('h'|'H')('t'|'T');


OFFSET: ('o'|'O')('f'|'F')('f'|'F')('s'|'S')('e'|'E')('t'|'T');

BOOL: ('b'|'B')('o'|'O')('o'|'O')('l'|'L');

AGGREGATION_OPERATOR
    : ('s'|'S')('u'|'U')('m'|'M')
    | ('m'|'M')('i'|'I')('n'|'N')
    | ('m'|'M')('a'|'A')('x'|'X')
    | ('a'|'A')('v'|'V')('g'|'G')
    | ('g'|'G')('r'|'R')('o'|'O')('u'|'U')('p'|'P')
    | ('s'|'S')('t'|'T')('d'|'D')('d'|'D')('e'|'E')('v'|'V')
    | ('s'|'S')('t'|'T')('d'|'D')('v'|'V')('a'|'A')('r'|'R')
    | ('c'|'C')('o'|'O')('u'|'U')('n'|'N')('t'|'T')
    | ('c'|'C')('o'|'O')('u'|'U')('n'|'N')('t'|'T')'_'('v'|'V')('a'|'A')('l'|'L')('u'|'U')('e'|'E')('s'|'S')
    | ('b'|'B')('o'|'O')('t'|'T')('t'|'T')('o'|'O')('m'|'M')('k'|'K')
    | ('t'|'T')('o'|'O')('p'|'P')('k'|'K')
    | ('q'|'Q')('u'|'U')('a'|'A')('n'|'N')('t'|'T')('i'|'I')('l'|'L')('e'|'E')
    ;

FUNCTION
    : 'abs'
    | 'absent'
    | 'absent_over_time'
    | 'ceil'
    | 'changes'
    | 'clamp_max'
    | 'clamp_min'
    | 'day_of_month'
    | 'day_of_week'
    | 'days_in_month'
    | 'delta'
    | 'deriv'
    | 'exp'
    | 'floor'
    | 'histogram_quantile'
    | 'holt_winters'
    | 'hour'
    | 'idelta'
    | 'increase'
    | 'irate'
    | 'label_join'
    | 'label_replace'
    | 'ln'
    | 'log2'
    | 'log10'
    | 'minute'
    | 'month'
    | 'predict_linear'
    | 'rate'
    | 'resets'
    | 'round'
    | 'scalar'
    | 'sort'
    | 'sort_desc'
    | 'sqrt'
    | 'time'
    | 'timestamp'
    | 'vector'
    | 'year'
    | 'avg_over_time'
    | 'min_over_time'
    | 'max_over_time'
    | 'sum_over_time'
    | 'count_over_time'
    | 'quantile_over_time'
    | 'stddev_over_time'
    | 'stdvar_over_time'
    ;

LEFT_BRACE:  '{';
RIGHT_BRACE: '}';

LEFT_PAREN:  '(';
RIGHT_PAREN: ')';

LEFT_BRACKET:  '[';
RIGHT_BRACKET: ']';

COMMA: ',';

SUBQUERY_RANGE
     : LEFT_BRACKET DURATION ':' DURATION? RIGHT_BRACKET;

TIME_RANGE
    : LEFT_BRACKET DURATION RIGHT_BRACKET;

DURATION: [0-9]+ ('s' | 'm' | 'h' | 'd' | 'w' | 'y');

METRIC_NAME: [a-zA-Z_:] [a-zA-Z0-9_:]*;
LABEL_NAME:  [a-zA-Z_] [a-zA-Z0-9_]*;

WS: [\r\t\n ]+ -> skip;
