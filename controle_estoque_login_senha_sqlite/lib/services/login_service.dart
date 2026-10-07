import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/login.dart';

class LoginService {

    Future<Database> abrirBanco() async {
        final caminhoBanco = await getDatabasesPath();

        print('LOCAL DO BANCO: $caminhoBanco');

        final caminho = join(caminhoBanco, 'login.db');

        final caminho = openDatabase(
            caminho,
            version: 1,

            onCreate: (db, version) async {
                await db.execute(
                    '''
                    CREATE TABLE usuario(
                      id INTEGER PRIMATY KEY AUTOINCREMENT,
                      nome TEXT NOT NULL,
                      email TEXT NOT NULL,
                      senha TEXT NOT NULL,
                    )
                    '''
                );
            }
        );
    }

    Future<void> inserirTarefa(Login login) async {
        final db = await abrirBanco();

        await db.insert('login', {
            'nome': login.nome, 
            'email': login.email,
            'senha': login.senha
        },);
    }

    Future<List<Login>> listarTarefa() async {
        final db = await abrirBanco();

        final dados = await db.query('login',);

        return dados.map((item){
            return Login(
                id: item['id'] as int,
                nome: item['nome'] as String,
                email: item['email'] as String,
                senha: item['senha'] as String,
            );
        }).toList();
    }
}