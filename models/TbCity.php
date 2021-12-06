<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tb_city".
 *
 * @property int $id
 * @property int $province_id
 * @property string $name
 *
 * @property TbProvince $province
 * @property TbCustomer[] $tbCustomers
 */
class TbCity extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tb_city';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['province_id', 'name'], 'required'],
            [['province_id'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => TbProvince::className(), 'targetAttribute' => ['province_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'province_id' => 'Province ID',
            'name' => 'Name',
        ];
    }

    /**
     * Gets query for [[Province]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(TbProvince::className(), ['id' => 'province_id']);
    }

    /**
     * Gets query for [[TbCustomers]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTbCustomers()
    {
        return $this->hasMany(TbCustomer::className(), ['city_id' => 'id']);
    }
}
