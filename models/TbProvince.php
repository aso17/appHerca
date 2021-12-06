<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tb_province".
 *
 * @property int $id
 * @property string $name_province
 *
 * @property TbCity[] $tbCities
 * @property TbCustomer[] $tbCustomers
 */
class TbProvince extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_province';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name_province'], 'required'],
            [['name_province'], 'string', 'max' => 50],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name_province' => 'Name Province',
        ];
    }

    /**
     * Gets query for [[TbCities]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTbCities()
    {
        return $this->hasMany(TbCity::className(), ['province_id' => 'id']);
    }

    /**
     * Gets query for [[TbCustomers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTbCustomers()
    {
        return $this->hasMany(TbCustomer::className(), ['provinsi_id' => 'id']);
    }
}
