-- Quando é criado um Efetuado é criado uma Compra com o idCompra seguinte, data e hora atuais e total calculado pela quantidade do produto selecionado, o nif é posto a NULL.

Drop TRIGGER if EXISTS InsertEfetuadoValido;