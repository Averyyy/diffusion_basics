from denoising_diffusion_pytorch import Unet, GaussianDiffusion, Trainer

model = Unet(
    dim=64,
    dim_mults=(1, 2, 4, 8)
).cuda()

diffusion = GaussianDiffusion(
    model,
    image_size=256,
    timesteps=1000,           # number of steps
    # number of sampling timesteps (using ddim for faster inference [see citation for ddim paper])
    sampling_timesteps=250,
    loss_type='l1'            # L1 or L2
).cuda()

trainer = Trainer(
    diffusion,
    'dataset',
    train_batch_size=2,
    train_lr=8e-5,
    train_num_steps=7000,         # total training steps
    gradient_accumulate_every=2,    # gradient accumulation steps
    ema_decay=0.995,                # exponential moving average decay
    amp=True                        # turn on mixed precision
)

trainer.train()
