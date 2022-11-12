begin transaction
rollback transaction

/*operations

1. disminuir 28 mil
2. aumentar 20mil*/

--Se ejecuta por linea
begin //iniciamos la transaccion
	update cuentras set saldos = saldo-20000 where numero = 'B';
	update cuentras set saldos = saldo+20000 where numero = 'B';
commit
