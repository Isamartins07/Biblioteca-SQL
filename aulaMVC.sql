/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT TOP (1000) [VendasID]
      ,[Produto]
      ,[Descricao]
      ,[DataVenda]
      ,[Valor]
  FROM [BancoVendas].[dbo].[Vendas]