///set_player_states()
if instance_exists(obj_Controller)
{
    if obj_Controller.MapType = "Platform"
    {
        AttackSprite = noone;
        if dir = -1
        {
            if Dashing
            {
                sprite_index = leftDashing;
                image_speed = 0 * FrameModulus;
            }
            else if Attacking
            {
                if instance_exists(htb_Sword)
                {
                    if OnGround
                    {
                        switch AttackNumber
                        {
                            case 1: sprite_index = leftAttackSword; AttackSprite = SwordAttack1_left; break;
                            case 2: sprite_index = leftAttackSwordTwo; AttackSprite = SwordAttack2_left; break;
                            case 3: sprite_index = leftAttackSwordThree; AttackSprite = SwordAttack3_left; break;
                        }
                    }
                    else
                    {
                        switch AttackNumber
                        {
                            case 1: sprite_index = leftAttackSwordInAir; break;
                            case 2: sprite_index = leftAttackSwordTwoInAir; break;
                            case 3: sprite_index = leftAttackSwordThreeInAir; break;
                        }
                    }
                    image_speed = 1 * FrameModulus;
                }
                else if Weapon = htb_Axe
                {
                    sprite_index = leftAttackAxe;
                    image_speed = 0.6 * FrameModulus;
                }
                else if instance_exists(htb_Greatsword)
                {
                    sprite_index = leftAttackGreatsword;
                    image_speed = 0.6 * FrameModulus;
                }
                else if instance_exists(htb_Claws)
                {
                    sprite_index = leftAttackClaws;
                    image_speed = 1 * FrameModulus;
                    if round(image_index) = image_number - 1
                    {
                        image_speed = 0;
                    }
                }
                else if instance_exists(htb_Scythe)
                {
                    sprite_index = leftAttackScythe;
                    image_speed = 0.6 * FrameModulus;
                }
            }
            else if LeftWallSliding
            {
                sprite_index = leftWallSliding;
                image_speed = 0 * FrameModulus;
            }
            else if Walking
            {
                sprite_index = leftWalking;
                image_speed = 0.5 * FrameModulus;
            }
            else if not OnGround and not OnSlope
            {
                sprite_index = leftInAir;
                image_speed = 0 * FrameModulus;        
            }
            else
            {
                sprite_index = leftStanding;
                image_speed = 0.0667 * FrameModulus;
                if not LungeDashing and abs(iSpeed) = 0
                {
                    hSpeed = 0;
                }
            }
        }
        else if dir = 1
        {
            if Dashing
            {
                sprite_index = rightDashing;
                image_speed = 0 * FrameModulus;
            }
            else if Attacking
            {
                if instance_exists(htb_Sword)
                {
                    if OnGround
                    {
                        switch AttackNumber
                        {
                            case 1: sprite_index = rightAttackSword; AttackSprite = SwordAttack1_right;  break;
                            case 2: sprite_index = rightAttackSwordTwo; AttackSprite = SwordAttack2_right;  break;
                            case 3: sprite_index = rightAttackSwordThree; AttackSprite = SwordAttack3_right;  break;
                        }
                    }
                    else
                    {
                        switch AttackNumber
                        {
                            case 1: sprite_index = rightAttackSwordInAir; break;
                            case 2: sprite_index = rightAttackSwordTwoInAir; break;
                            case 3: sprite_index = rightAttackSwordThreeInAir; break;
                        }
                    }
                    image_speed = 1 * FrameModulus;
                }
                else if Weapon = htb_Axe
                {
                    sprite_index = rightAttackAxe;
                    image_speed = 0.6 * FrameModulus;
                }
                else if instance_exists(htb_Greatsword)
                {
                    sprite_index = rightAttackGreatsword;
                    image_speed = 0.6 * FrameModulus;
                }
                else if instance_exists(htb_Claws)
                {
                    sprite_index = rightAttackClaws;
                    image_speed = 1 * FrameModulus;
                    if round(image_index) = image_number - 1
                    {
                        image_speed = 0;
                    }
                }
                else if instance_exists(htb_Scythe)
                {
                    sprite_index = rightAttackScythe;
                    image_speed = 0.6 * FrameModulus;
                }
            }
            else if RightWallSliding
            {
                sprite_index = rightWallSliding;
                image_speed = 0 * FrameModulus;
            }
            else if Walking
            {
                sprite_index = rightWalking;
                image_speed = 0.5 * FrameModulus;
            }
            else if not OnGround and not OnSlope
            {
                sprite_index = rightInAir;
                image_speed = 0 * FrameModulus;        
            }
            else
            {
                sprite_index = rightStanding;
                image_speed = 0.0667 * FrameModulus;
                if not LungeDashing and abs(iSpeed) = 0
                {
                    hSpeed = 0;
                }
            }
        }
    }
    else if obj_Controller.MapType = "World"
    {
        image_speed = 0.25 * FrameModulus; 
        if obj_GUI.khLeft
        {
            sprite_index = worldLeft;           
        }
        else if obj_GUI.khRight
        {
            sprite_index = worldRight;         
        }
        else if obj_GUI.khUp
        {
            sprite_index = worldUp;          
        }
        else if obj_GUI.khDown
        {
            sprite_index = worldDown;         
        }
        else
        {
            sprite_index = worldStanding;
            image_speed = 0.0667 * FrameModulus;  
        }
    }
}
