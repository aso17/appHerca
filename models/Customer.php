<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tb_customer".
 *
 * @property int $id
 * @property string $namacustomer
 * @property int $provinsi_id
 * @property int $city_id
 *
 * @property TbCity $city
 * @property TbProvince $provinsi
 */
class Customer extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_customer';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['namacustomer', 'provinsi_id', 'city_id'], 'required'],
            [['provinsi_id', 'city_id'], 'integer'],
            [['namacustomer'], 'string', 'max' => 50],
            [['provinsi_id'], 'exist', 'skipOnError' => true, 'targetClass' => TbProvince::className(), 'targetAttribute' => ['provinsi_id' => 'id']],
            [['city_id'], 'exist', 'skipOnError' => true, 'targetClass' => TbCity::className(), 'targetAttribute' => ['city_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'namacustomer' => 'Namacustomer',
            'provinsi_id' => 'Provinsi ID',
            'city_id' => 'City ID',
        ];
    }
    // public function getcustomer()
    // {
    //     return $this->hasMany(TbCity::class, ['id' => 'city_id']);
    // }

    /**
     * Gets query for [[City]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getCity()
    {
        return $this->hasOne(TbCity::className(), ['id' => 'city_id']);
    }

    /**
     * Gets query for [[Provinsi]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProvinsi()
    {
        return $this->hasOne(TbProvince::className(), ['id' => 'provinsi_id']);
    }
}