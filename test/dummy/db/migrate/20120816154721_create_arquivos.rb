class CreateArquivos < ActiveRecord::Migration
  def change
    create_table :arquivos do |t|
    	 t.attachment :file

      t.timestamps
    end
  end
end
